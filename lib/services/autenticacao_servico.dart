import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  get user => null;

  // ----- Método para cadastrar novos usuários ----- //
  Future<String?> cadastrarUsuario({
    required String email,
    required String senha,
    required String nome,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );
      await userCredential.user!.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "Já cadastrado";
      }
      return "Erro desconhecido";
    }
  }

  // ----- Método para atualizar email ----- //
  Future<void> atualizaEmail(String email) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updateEmail(email);
        await user.reload();
        user = FirebaseAuth.instance.currentUser;
        print("Email atualizado com sucesso!");
      }
    } catch (e) {
      print("Erro ao atualizar email: $e");
    }
  }

  // ----- Método para atualizar senha ----- //
  Future<void> atualizaSenha(String senha) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.updatePassword(senha);
        print("Senha atualizada com sucesso!");
      }
    } catch (e) {
      print("Erro ao atualizar senha: $e");
    }
  }

  // ----- Método para logar usuários já cadastrados ----- //
  Future<String?> logarUsuario({
    required String email,
    required String senha,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: senha);
      return null;
    } on FirebaseAuthException catch (e) {
      return "Email não cadastrado";
    }
  }

  // ----- Método para deslogar usuários logados ----- //
  Future<void> deslogar() async {
    return _firebaseAuth.signOut();
  }

  // ----- Método para reautenticação do firebase ----- //
  Future<void> reautenticaUsuario(String email, String password) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        AuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);
        await user.reauthenticateWithCredential(credential);
        print("Reautenticação bem-sucedida!");
      }
    } catch (e) {
      print("Erro na reautenticação: $e");
      throw e; // Opcional, para informar o erro na UI
    }
  }
}

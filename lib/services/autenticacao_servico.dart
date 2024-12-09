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
  Future<String?> atualizaEmail({
    required String email,
  }) async {
    try {
      UserCredential userCredential =
      await user?.updateEmail(
        email: email,
      );
      await userCredential.user!.updateDisplayName(email);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "Email já cadastrado";
      }
      return "Erro desconhecido";
    }
  }

  // ----- Método para atualizar senha ----- //
  Future<String?> atualizaSenha({
    required String senha,
  }) async {
    try {
      UserCredential userCredential =
      await user?.updateEmail(
        email: senha,
      );
      await userCredential.user!.updateDisplayName(senha);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return "Senha já cadastrada";
      }
      return "Erro desconhecido";
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
}

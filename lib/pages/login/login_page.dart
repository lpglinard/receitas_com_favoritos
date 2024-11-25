import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:prato_do_dia_app/common/buttons/buttons.dart';
import 'package:prato_do_dia_app/common/forms/form_decoration.dart';
import 'package:prato_do_dia_app/common/snackBar/snackBar.dart';
import 'package:prato_do_dia_app/services/autenticacao_servico.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool queroEntrar = true;
  bool _passwordIsHidden = true;
  bool _resetPasswordIsHidden = true;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();
  final AutenticacaoServico _autenticacaoServico = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 94.0),

              // ----- Texto do início da página ----- //
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    (queroEntrar) ? "Olá," : "Criar uma conta",
                    style: AppTextStyles.titulo
                        .copyWith(color: AppColors.textoPreto),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    (queroEntrar) ? "Bem vindo novamente!" : "",
                    style: AppTextStyles.tituloMenor
                        .copyWith(color: AppColors.textoPreto),
                  ),
                ),
              ]),

              const SizedBox(height: 40.0),

              // ----- Campo preencher E-mail ----- //
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: AppTextStyles.subtitulo
                      .copyWith(color: AppColors.gradienteClaro),
                ),
              ),

              const SizedBox(height: 5.0),

              TextFormField(
                controller: _emailController,
                decoration: getInputDecoration("Insira seu email"),
                validator: (String? value) {
                  if (value == null) {
                    return "Campo obrigatório";
                  }
                  if (value.length < 6) {
                    return "O email é muito curto";
                  }
                  if (!value.contains("@")) {
                    return "O email não é válido";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15.0),

              // ----- Campo preencher Senha ----- //
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Senha',
                  style: AppTextStyles.subtitulo
                      .copyWith(color: AppColors.gradienteClaro),
                ),
              ),

              const SizedBox(height: 5.0),

              TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(
                  labelText: "Insira sua senha",
                  labelStyle: const TextStyle(
                    color: AppColors.gradienteClaro,
                    fontSize: 15,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.gradienteClaro),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.gradienteClaro, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: InkWell(
                    borderRadius: BorderRadius.circular(20.0),
                    onTap: () {
                      log("Pressed");
                      setState(() {
                        _passwordIsHidden = !_passwordIsHidden;
                      });
                    },
                    child: Icon(
                      (_passwordIsHidden)
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColors.gradienteClaro,
                    ),
                  ),
                ),
                obscureText: _passwordIsHidden,
                validator: (String? value) {
                  if (value == null) {
                    return "Campo obrigatório";
                  }
                  if (value.length < 8) {
                    return "A senha é muito curta";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 8.0),

              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  (queroEntrar)
                      ? ""
                      : "Mínimo de 8 caracteres, 1 número e 1 Maiúscula",
                  style: AppTextStyles.pequeno
                      .copyWith(color: AppColors.gradienteEscuro),
                ),
              ),

              const SizedBox(height: 15.0),

              // ----- Campos de Cadastro ----- //
              Visibility(
                visible: !queroEntrar,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Confirmar senha',
                        style: AppTextStyles.subtitulo
                            .copyWith(color: AppColors.gradienteClaro),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                        labelText: "Insire a senha novamente",
                        labelStyle: const TextStyle(
                          color: AppColors.gradienteClaro,
                          fontSize: 15,
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.gradienteClaro),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: AppColors.gradienteClaro, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: InkWell(
                          borderRadius: BorderRadius.circular(20.0),
                          onTap: () {
                            log("Pressed");
                            setState(() {
                              _resetPasswordIsHidden = !_resetPasswordIsHidden;
                            });
                          },
                          child: Icon(
                            (_resetPasswordIsHidden)
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.gradienteClaro,
                          ),
                        ),
                      ),
                      obscureText: _resetPasswordIsHidden,
                      validator: (String? value) {
                        if (value == null) {
                          return "Campo obrigatório";
                        }
                        if (value != _senhaController.text) {
                          return "As senhas não são iguais";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nome',
                        style: AppTextStyles.subtitulo
                            .copyWith(color: AppColors.gradienteClaro),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      controller: _nomeController,
                      decoration: getInputDecoration("Insire seu nome"),
                      validator: (String? value) {
                        if (value == null) {
                          return "Campo obrigatório";
                        }
                        if (value.length < 3) {
                          return "O nome é muito curto";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),

              // ----- Botões de login/cadastro ----- \\
              ElevatedButton(
                style: login,
                child: Text(
                  (queroEntrar) ? "Entrar" : "Cadastrar",
                  style: AppTextStyles.subtituloBotao
                      .copyWith(color: AppColors.textoBranco),
                ),
                onPressed: () {
                  botaoPrincipalClicado();
                },
              ),

              const SizedBox(height: 16.0),

              TextButton(
                onPressed: () {
                  setState(() {
                    queroEntrar = !queroEntrar;
                  });
                },
                child: Text(
                  (queroEntrar)
                      ? "Ainda não tem conta? Cadastre-se!"
                      : "Já tem uma conta? Entrar",
                  style: AppTextStyles.emailSenha
                      .copyWith(color: AppColors.amarelo),
                ),
              ),

              // ----- Imagem de domínio Edamam ----- //
              const SizedBox(height: 30.0),

              Visibility(
                visible: queroEntrar,
                child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/Edamam_Badge_Transparent.png',
                    height: 34,
                    width: 170,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  // ----- Funções de quando o botão de login/cadastro é clicado ----- //
  botaoPrincipalClicado() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String nome = _nomeController.text;

    // ----- Se passar da validação ----- //
    if (_formkey.currentState!.validate()) {
      // ----- Quando no estado de login ----- //
      // Navigator.pushNamed(context, '/home');
      if (queroEntrar) {
        _autenticacaoServico.logarUsuario(email: email, senha: senha).then(
          (String? erro) {
            if (erro != null) {
              showSnackBar(context: context, texto: erro);
            }
          },
        );
        log("Entrada Validada");

        // ----- Quando no estado de cadastrar ----- //
      } else {
        _autenticacaoServico
            .cadastrarUsuario(email: email, senha: senha, nome: nome)
            .then(
          (String? erro) {
            if (erro != null) {
              showSnackBar(
                context: context,
                texto: erro,
              );
            }
          },
        );
        log("Cadastro Validado");
        log("${_emailController.text}, ${_senhaController.text}, ${_nomeController.text},");
      }

      // ----- Se não passar da validação ----- //
    } else {
      log("Form inválido");
    }
  }
}

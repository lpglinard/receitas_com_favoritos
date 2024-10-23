import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 94.0,
          child: Container(
            color: AppColors.transparente,
          ),
        ),
        Container(
          child: Column(
              // ----- Campo de preencher E-mail ----- \\
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Olá,',
                    style: AppTextStyles.titulo
                        .copyWith(color: AppColors.textoPreto),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Bem vindo!',
                    style: AppTextStyles.tituloMenor
                        .copyWith(color: AppColors.textoPreto),
                  ),
                ),
              ]),
        ),
        SizedBox(
          height: 80.0,
          child: Container(
            color: AppColors.transparente,
          ),
        ),
        Container(
          child: Column(children: [
            Container(
              child: Column(children: [
                // ----- Campo de preencher E-mail ----- \\
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                    style: AppTextStyles.emailSenha
                        .copyWith(color: AppColors.textoPreto),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                  child: Container(
                    color: AppColors.transparente,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.transparente,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(width: 1.5, color: Colors.grey),
                  ),
                  child: Text(
                    'Insira seu email',
                    style:
                        AppTextStyles.emailSenha.copyWith(color: Colors.grey),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                  child: Container(
                    color: AppColors.transparente,
                  ),
                ),

                // ----- Campo de preencher senha ----- \\
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Senha',
                    style: AppTextStyles.emailSenha
                        .copyWith(color: AppColors.textoPreto),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                  child: Container(
                    color: AppColors.transparente,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  alignment: Alignment.centerLeft,
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.transparente,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    border: Border.all(width: 1.5, color: Colors.grey),
                  ),
                  child: Text(
                    'Insira sua senha',
                    style:
                        AppTextStyles.emailSenha.copyWith(color: Colors.grey),
                  ),
                ),

                SizedBox(
                  height: 10.0,
                  child: Container(
                    color: AppColors.transparente,
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Esqueceu sua senha?',
                    style: AppTextStyles.esqueceuSenha
                        .copyWith(color: AppColors.amarelo),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                  child: Container(
                    color: AppColors.transparente,
                  ),
                ),

                // ----- Botão de login ----- \\
                Container(
                  // ----- Botão de login ----- \\
                  alignment: Alignment.center,
                  margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  height: 54,
                  decoration: const BoxDecoration(
                      color: AppColors.gradienteClaro,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ]),
                  child: Text(
                    'Entrar',
                    style: AppTextStyles.subtituloBotao
                        .copyWith(color: AppColors.textoBranco),
                  ),
                ),
              ]),
            ),
          ]),
        ),
        Container(
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 165.0,
                child: Container(
                  color: AppColors.transparente,
                ),
              ),
              Container(
                child: Text(
                  'Ainda não tem conta? ',
                  style: AppTextStyles.emailSenha.copyWith(
                    color: AppColors.textoPreto,
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Cadastrar',
                  style: AppTextStyles.esqueceuSenha
                      .copyWith(color: AppColors.amarelo),
                ),
              ),
            ]),
            Container(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/Edamam_Badge_Transparent.png',
                height: 34,
                width: 170,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

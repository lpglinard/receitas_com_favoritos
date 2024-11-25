import 'package:flutter/material.dart';
import 'package:prato_do_dia_app/common/forms/form_decoration.dart';
import 'package:prato_do_dia_app/services/autenticacao_servico.dart';
import '../../common/buttons/buttons.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 64.0,
            child: Container(
              color: AppColors.transparente,
            ),
          ),

          // ----- Texto do topo da página ----- //
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Text(
              'Meu perfil',
              style: AppTextStyles.tituloIntermediarioBold.copyWith(
                color: AppColors.gradienteEscuro,
              ),
            ),
          ),

          const SizedBox(height: 20.0),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // ----- Círculos de decoração da foto de perfil ----- //
                        Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: AppColors.transparente,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.cinzaEscuro,
                              width: 1.0,
                            ),
                          ),
                        ),
                        Container(
                          width: 160.0,
                          height: 160.0,
                          decoration: BoxDecoration(
                            color: AppColors.transparente,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.cinzaClaro,
                              width: 1.0,
                            ),
                          ),
                        ),

                        // ----- Foto de perfil ----- //
                        Container(
                          height: 130.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(65.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.45),
                                blurRadius: 8.0,
                                offset: const Offset(4, 6),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(65.0),
                            child: Image.asset(
                              "assets/images/picture.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5.0),

                    // ----- Nome do usuário ---- //
                    Text(
                      'Davi Ribeiro',
                      style: AppTextStyles.tituloMenor.copyWith(
                        color: AppColors.gradienteEscuro,
                      ),
                    ),

                    const SizedBox(height: 10.0),

                    // ----- Dados do perfil ----- //
                    Column(
                      children: [
                        const SizedBox(height: 10.0),

                        // ----- Campo Email ----- //
                        _buildLabelField(
                          label: 'E-mail',
                          value: 'davi.ribeiro@sempreceub.com',
                        ),

                        const SizedBox(height: 10.0),

                        // ----- Campo Senha ----- //
                        _buildLabelField(
                          label: 'Senha',
                          value: '**********',
                        ),

                        const SizedBox(height: 30.0),

                        // ----- Botão atualizar dados ----- //
                        ElevatedButton(
                          style: atualizarDados,
                          child: Text(
                            "Atualizar dados",
                            style: AppTextStyles.emailSenha.copyWith(
                              color: AppColors.textoBranco,
                            ),
                          ),
                          onPressed: () {
                            // ----- modal de alteração dos dados ----- //
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 350,
                                    child: Column(
                                      children: [
                                        // ----- Ícone de fechar o modal ----- //
                                        Container(
                                          alignment: Alignment.centerRight,
                                          child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon:
                                                const Icon(Icons.close_rounded),
                                          ),
                                        ),

                                        // ----- campos dos dados que serão alterados ----- //
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 0, 15, 0),
                                          child: Column(
                                            children: [
                                              // ----- campo alterar email ----- //
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 0, 0, 0),
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Novo email',
                                                  style: AppTextStyles.subtitulo
                                                      .copyWith(
                                                          color: AppColors
                                                              .gradienteClaro),
                                                ),
                                              ),

                                              const SizedBox(height: 5.0),

                                              TextFormField(
                                                decoration: getInputDecoration(
                                                    "Insira o novo email"),
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

                                              // ----- campo alterar senha ----- //
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Nova senha',
                                                  style: AppTextStyles.subtitulo
                                                      .copyWith(
                                                          color: AppColors
                                                              .gradienteClaro),
                                                ),
                                              ),

                                              const SizedBox(height: 5.0),

                                              TextFormField(
                                                decoration: InputDecoration(
                                                  labelText:
                                                      "Insira a nova senha",
                                                  labelStyle: const TextStyle(
                                                    color: AppColors
                                                        .gradienteClaro,
                                                    fontSize: 15,
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 8, 8, 8),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: AppColors
                                                            .gradienteClaro),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: AppColors
                                                                .gradienteClaro,
                                                            width: 2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.red),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Colors.red),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                obscureText: true,
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
                                            ],
                                          ),
                                        ),

                                        const SizedBox(height: 20.0),

                                        // ----- Botão de atualizar os dados inceridos ----- //
                                        ElevatedButton(
                                          style: atualizarDados,
                                          child: Text(
                                            "Atualizar",
                                            style: AppTextStyles.emailSenha
                                                .copyWith(
                                              color: AppColors.textoBranco,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),

                        const SizedBox(height: 20.0),

                        // ----- Botão de logout ----- //
                        ElevatedButton(
                          style: sair,
                          child: Text(
                            "Sair",
                            style: AppTextStyles.emailSenha.copyWith(
                              color: AppColors.textoBranco,
                            ),
                          ),
                          onPressed: () {
                            AutenticacaoServico().deslogar();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // ----- BottomAppBar ----- //
      bottomNavigationBar: BottomAppBar(
        height: 70,
        color: AppColors.gradienteClaro,
        child: IconTheme(
          data: const IconThemeData(color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.bookmark_outline,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/favorites');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.person,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ----- Função para campos de texto reutilizáveis, como ps dados de usuário ----- //
  Widget _buildLabelField({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.subtitulo.copyWith(
            color: AppColors.gradienteEscuro,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.transparente,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            border: Border.all(width: 1.5, color: AppColors.gradienteClaro),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              value,
              style: AppTextStyles.emailSenha.copyWith(
                color: AppColors.gradienteClaro,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

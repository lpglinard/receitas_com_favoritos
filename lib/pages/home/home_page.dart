import 'package:flutter/material.dart';
import '../../common/buttons/buttons.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/forms/form_result_decoration.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 64.0),

          // ----- Textos do topo da página ----- //
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Qual o prato de hoje?',
                    style: AppTextStyles.titulo.copyWith(color: AppColors.textoPreto),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Busque suas receitas e as favorite\nfacilmente em alguns passos',
                    style: AppTextStyles.emailSenha.copyWith(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30.0),

          // ----- Campo de pesquisa por receitas ----- //
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: getResultDecoration("Procurar receitas"),
                    ),

                    const SizedBox(height: 15.0),

                    ElevatedButton(
                      style: pesquisar,
                      child: Text(
                        "Pesquisar",
                        style: AppTextStyles.subtituloBotao.copyWith(color: AppColors.textoBranco),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/pesquisar');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 20.0),

          // ----- Campo resultados da pesquisa ----- //
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Últimas buscas',
                      style: AppTextStyles.subtituloBold.copyWith(color: AppColors.textoPreto),
                    ),
                  ),

                  const SizedBox(height: 10.0),


                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Seu histórico de pesquisa aparecerá aqui',
                      style: AppTextStyles.regularFina.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // ----- Bottom navegation bar ----- //
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
                  Icons.home,
                  size: 30,
                ),
                onPressed: () {},
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
                  Icons.person_outlined,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/forms/form_search_result_decoration.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 64.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 30, 0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            Text(
              'Receitas encontradas',
              style: AppTextStyles.tituloIntermediario
                  .copyWith(color: AppColors.textoPreto),
            ),
          ]),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Form(
            child: TextFormField(
              decoration: getSearchResultDecoration("Frango"),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Resultados',
                  style: AppTextStyles.subtitulo
                      .copyWith(color: AppColors.textoPreto),
                ),
              ),
              Text(
                '8 resultados',
                style: AppTextStyles.emailSenha
                    .copyWith(color: AppColors.cinzaEscuro),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 400.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        color: AppColors.cinzaClaro,
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: AppColors.gradienteClaro,
                          width: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
            ]),
          ),
        ),
      ]),
    );
  }
}

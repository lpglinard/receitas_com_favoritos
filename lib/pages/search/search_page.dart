import 'package:flutter/material.dart';
import 'package:prato_do_dia_app/common/forms/form_result_decoration.dart';
import '../../common/buttons/buttons.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/forms/form_decoration.dart';
import '../../common/forms/form_search_result_decoration.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 64.0,
          child: Container(
            color: AppColors.transparente,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 30, 0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pushNamed(context, '/retornaMenu');
                  },
                ),
                Text(
                  'Receitas encontradas',
                  style:
                  AppTextStyles.tituloIntermediario.copyWith(color: AppColors.textoPreto),
                ),
              ]),
        ),
        SizedBox(
          height: 20.0,
          child: Container(
            color: AppColors.transparente,
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Form(
            child: SingleChildScrollView(
              child:
                  TextFormField(
                    decoration: getSearchResultDecoration("Frango"),
                  ),
            )
          ),
        ),


        SizedBox(
          height: 20.0,
          child: Container(
            color: AppColors.transparente,
          ),
        ),
        Expanded(
          child:
          Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    '235 resultados',
                    style: AppTextStyles.emailSenha
                        .copyWith(color: AppColors.cinzaEscuro),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
              child: Container(
                color: AppColors.transparente,
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}

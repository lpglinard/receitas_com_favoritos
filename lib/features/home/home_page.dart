import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Olá Davi',
                style:
                    AppTextStyles.titulo.copyWith(color: AppColors.textoPreto),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Qual o prato de hoje?',
                style: AppTextStyles.emailSenha.copyWith(color: Colors.grey),
              ),
            ),
          ]),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/picture.png',
              height: 40,
              width: 40,
            ),
          ),
        ]),
        SizedBox(
          height: 30.0,
          child: Container(
            color: AppColors.transparente,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              alignment: Alignment.centerLeft,
              height: 40,
              width: 255,
              decoration: BoxDecoration(
                color: AppColors.transparente,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
                border: Border.all(width: 1.5, color: Colors.grey),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Image.asset(
                      'assets/images/search_icon.png',
                      height: 18,
                      width: 18,
                    ),
                  ),
                  Text(
                    'Procurar receita',
                    style:
                        AppTextStyles.regularFina.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/images/filter.png',
              height: 40,
              width: 40,
            ),
          ),
        ]),
        SizedBox(
          height: 20.0,
          child: Container(
            color: AppColors.transparente,
          ),
        ),
        Expanded(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              alignment: Alignment.centerLeft,
              child: Text(
                'Últimas buscas',
                style: AppTextStyles.subtituloBold
                    .copyWith(color: AppColors.textoPreto),
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
                'Seu histórico de pesquisa aparecerá aqui',
                style: AppTextStyles.regularFina.copyWith(color: Colors.grey),
              ),
            ),
          ]),
        ),
        Container(
          height: 110,
          alignment: Alignment.center,
          child: Stack(children: [
            Container(
              color: AppColors.gradienteClaro,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                padding: const EdgeInsets.fromLTRB(50, 39, 0, 0),
                child: Image.asset(
                  'assets/images/home_icon.png',
                  height: 24,
                  width: 24,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 39, 0, 0),
                child: Image.asset(
                  'assets/images/favorite_icon.png',
                  height: 24,
                  width: 24,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 39, 50, 0),
                child: Image.asset(
                  'assets/images/profile_icon.png',
                  height: 24,
                  width: 24,
                ),
              ),
            ]),
          ]),
        ),
      ]),
    );
  }
}

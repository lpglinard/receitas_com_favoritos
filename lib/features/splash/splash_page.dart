import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Stack(
              alignment: Alignment.center,
              children: [
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.gradienteEscuro,
                    AppColors.gradienteMedio,
                  ],
                ),
              ),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Container(
                child: Image.asset('assets/images/chapeu.png',
                  height: 79,
                  width: 79,
                ),
              ),
              SizedBox(
                height: 12.0,
                child: Container(
                  color: AppColors.transparente,
                ),
              ),
              Container(
                child: Text('+ 2.3 Milhões de receitas',
                  style: AppTextStyles.subtituloBold.copyWith(color: AppColors.textoBranco),
                ),
              ),
            ]),
          ]),
        ),

        Expanded(
          child: Stack(
              alignment: Alignment.center,
              children: [
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.gradienteMedio,
                    AppColors.gradienteClaro,
                  ],
                ),
              ),
            ),
            Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "PraTo do Dia",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titulo.copyWith(color: AppColors.textoBranco),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "\nUma forma simples de encontrar\na receita perfeita\n",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.subtitulo.copyWith(color: AppColors.textoBranco),
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                    child: Container(
                      color: AppColors.transparente,
                    ),
                  ),
                  Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 54.0,
                          child: Container(
                            color: AppColors.transparente,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 54,
                          width: 243,
                          decoration: const BoxDecoration(
                            color: AppColors.gradienteEscuro,
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 4,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              )
                            ]
                          ),
                          child: Text(
                            'Começar',
                            style: AppTextStyles.subtituloBotao.copyWith(color: AppColors.textoBranco),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 60.0,
                    child: Container(
                      color: AppColors.transparente,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/Edamam_Badge_Transparent.png',
                      height: 34,
                      width: 170,),
                  ),
            ]),
          ]),
        ),
      ]),
    );
  }
}
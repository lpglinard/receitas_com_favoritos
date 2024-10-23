import 'package:flutter/material.dart';
import 'package:prato_do_dia_app/common/buttons/buttons.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // Metade superior da tela
        Expanded(
          child: Stack(
              alignment: Alignment.center,
              children: [
            // Background da metade superior da tela
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
            // Itens da metade superior da tela
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              // Imagem de chpaéu de chefe
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
              // Texto da imagem
              Container(
                child: Text('+ 2.3 Milhões de receitas',
                  style: AppTextStyles.subtituloBold.copyWith(color: AppColors.textoBranco),
                ),
              ),
            ]),
          ]),
        ),

        // Metade inferior da tela
        Expanded(
          child: Stack(
              alignment: Alignment.center,
              children: [
            // Backgprund da metade inferior da tela
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
            // Coluna de itens da metade inferior da tela
            Column(
                children: [
                  // Título
                  Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "PraTo do Dia",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titulo.copyWith(color: AppColors.textoBranco),
                    ),
                  ),
                  // Subtítulo
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
                  // Botão
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
                          child: ElevatedButton(
                            style: comecar,
                            child: Text(
                                'Começar',
                                style: AppTextStyles.subtituloBotao.copyWith(color: AppColors.textoBranco),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/home');
                              },
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: 60.0,
                    child: Container(
                      color: AppColors.transparente,
                    ),
                  ),
                  // Basge Edamam
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
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
        Expanded(
          child: Stack(alignment: Alignment.center, children: [
            // ----- Background da metade superior da tela ----- //
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

            // ----- Conteúdo da metade superior da tela ----- //
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              // ----- Imagem de chpaéu de chefe ----- //
              Image.asset(
                'assets/images/chapeu.png',
                height: 79,
                width: 79,
              ),

              const SizedBox(height: 12.0),

              // ----- Texto da imagem ----- //
              Text(
                '+ 2.3 Milhões de receitas',
                style: AppTextStyles.subtituloBold
                    .copyWith(color: AppColors.textoBranco),
              ),
            ]),
          ]),
        ),
        Expanded(
          child: Stack(alignment: Alignment.center, children: [
            // ----- Backgprund da metade inferior da tela ----- //
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

            // ----- Conteúdo da metade inferior da tela ----- //
            Column(children: [
              // ----- Título do App ----- //
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "PraTo do Dia",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titulo
                      .copyWith(color: AppColors.textoBranco),
                ),
              ),
              // ----- Subtítulo/Texto introdutório ----- //
              Container(
                alignment: Alignment.center,
                child: Text(
                  "\nUma forma simples de encontrar\na receita perfeita\n",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitulo
                      .copyWith(color: AppColors.textoBranco),
                ),
              ),

              const SizedBox(height: 35.0),

              // ----- Botão de Login ----- //
              ElevatedButton(
                style: comecar,
                child: Text(
                  "Começar",
                  style: AppTextStyles.subtituloBotao
                      .copyWith(color: AppColors.textoBranco),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),

              const SizedBox(height: 60.0),

              // ----- Badge de Placeholder da Edamam ----- //
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/Edamam_Badge_Transparent.png',
                  height: 34,
                  width: 170,
                ),
              ),
            ]),
          ]),
        ),
      ]),
    );
  }
}

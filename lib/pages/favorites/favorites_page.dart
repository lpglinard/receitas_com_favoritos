import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Receitas salvas',
                style: AppTextStyles.tituloIntermediarioBold.copyWith(
                  color: AppColors.textoPreto,
                ),
              ),
            ),
          ),

          const SizedBox(height: 40.0),

          // ----- Lista de receitas favoritadas ----- //
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Suas receitas favoritadas\naparecerão aqui',
                      style: AppTextStyles.emailSenha.copyWith(
                        color: AppColors.cinzaEscuro,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15.0),

                  // ----- Receitas ----- //
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
          ),
        ],
      ),

      // ----- Bottom Navigation Bar ----- //
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
                  Navigator.pushNamed(context, '/retornaMenu');
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.bookmark,
                  size: 30,
                ),
                onPressed: () {},
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

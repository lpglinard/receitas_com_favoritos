import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';

final ButtonStyle comecar = ElevatedButton.styleFrom(
  minimumSize: const Size(243, 54),
  backgroundColor: AppColors.gradienteEscuro,
  elevation: 5,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

final ButtonStyle login = ElevatedButton.styleFrom(
  minimumSize: const Size(350, 54),
  backgroundColor: AppColors.gradienteClaro,
  elevation: 5,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

final ButtonStyle pesquisar = ElevatedButton.styleFrom(
  minimumSize: const Size(350, 50),
  backgroundColor: AppColors.gradienteClaro,
  elevation: 5,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

final ButtonStyle atualizarFoto = ElevatedButton.styleFrom(
  minimumSize: const Size(160, 40),
  backgroundColor: AppColors.transparente,
  elevation: 5,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

final ButtonStyle sair = ElevatedButton.styleFrom(
  minimumSize: const Size(350, 50),
  backgroundColor: AppColors.vermelho,
  elevation: 5,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

final ButtonStyle atualizarDados = ElevatedButton.styleFrom(
  minimumSize: const Size(350, 50),
  backgroundColor: AppColors.gradienteEscuro,
  elevation: 5,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
);

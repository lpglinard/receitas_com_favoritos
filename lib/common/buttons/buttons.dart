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
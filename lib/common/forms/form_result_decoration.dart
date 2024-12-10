import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

InputDecoration getResultDecoration(String label) {
  return InputDecoration(
      hintText: label,
      hintStyle: const TextStyle(
        color: AppColors.cinzaClaro,
        fontSize: 15,
      ),
      contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.bordaClara),
        borderRadius: BorderRadius.circular(10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(10),
      ),
      prefixIcon: const Icon(
        Icons.search,
        color: AppColors.cinzaClaro,
      ));
}

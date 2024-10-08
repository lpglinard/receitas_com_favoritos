import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle regularFina = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w200,
  );
  static const TextStyle esqueceuSenha = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    decorationColor: Color(0xFFFF9C00),
  );
  static const TextStyle emailSenha = TextStyle(
    fontFamily: 'Inter',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle subtitulo = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle subtituloBold = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subtituloBotao = TextStyle(
    fontFamily: 'Inter',
    fontSize: 18.0,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle tituloMenor = TextStyle(
    fontFamily: 'Inter',
    fontSize: 20.0,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle titulo = TextStyle(
    fontFamily: 'Inter',
    fontSize: 30.0,
    fontWeight: FontWeight.w600,
  );
}

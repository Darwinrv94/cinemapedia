import 'package:flutter/material.dart';

class AppTheme {

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.white,
    brightness: Brightness.dark
    //colorSchemeSeed: const Color(0xFF2862F5)
  );

}

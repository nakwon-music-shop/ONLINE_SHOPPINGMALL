import 'package:flutter/material.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
            backgroundColor: WidgetStatePropertyAll(Colors.black),
            foregroundColor: WidgetStatePropertyAll(Colors.white))));

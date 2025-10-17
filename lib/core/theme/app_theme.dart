import 'package:flutter/material.dart';

class AppThemes {
  // Paleta de Colores Base
  static const Color lightPrimaryColor = Colors.redAccent;
  static const Color lightSecondaryColor = Colors.orangeAccent;
  // Paleta de Colores Base
  static const Color darkPrimaryColor = Colors.white70;
  static const Color darkSecondaryColor = Color.fromARGB(255, 30, 30, 30);

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    
    // Colores principales
    primaryColor: lightPrimaryColor,
    colorScheme: const ColorScheme.light(
      primary: lightPrimaryColor,
      secondary: lightSecondaryColor,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSurface: Colors.black,
    ),


    // Estilos de texto
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    
    // Tema para AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: lightPrimaryColor,
      foregroundColor: Colors.black,
      elevation: 0,
    ),

    // Tema para TextField (InputDecoration)
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );



  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    
    // Colores principales
    primaryColor: darkPrimaryColor,
    colorScheme: const ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      surface: Color(0xFF121212), // Fondo oscuro
      onPrimary: Colors.white,
      onSurface: Colors.white70,
    ),

    // Estilos de texto
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
    
    // Tema para AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    // Tema para TextField (InputDecoration)
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
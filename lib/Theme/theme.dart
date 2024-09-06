import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color buttonColor = Color(0xFFF07462);
  static final Color containerColor = Color.alphaBlend(const Color(0xFF90979F), const Color(0xFF3C4451));
  static final Color backgroundColor = Color.alphaBlend(const Color(0xFF333A48), const Color(0xFF2B323E));
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData get theme => ThemeData(
        primaryColor: buttonColor,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: ColorScheme.dark(
          primary: buttonColor,
          secondary: containerColor,
          surface: backgroundColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: white,
            elevation: 4,
            shadowColor: white.withOpacity(0.3),
          ),
        ),
        textTheme: GoogleFonts.latoTextTheme(
          const TextTheme(
            displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: white),
            displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: white),
            displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: white),
            headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: white),
            headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: white),
            titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: white),
            bodyLarge: TextStyle(fontSize: 16, color: white),
            bodyMedium: TextStyle(fontSize: 14, color: white),
            labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: white),
          ),
        ),
        cardTheme: CardTheme(
          color: containerColor,
          elevation: 4,
          shadowColor: white.withOpacity(0.1),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          elevation: 0,
          titleTextStyle: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      );
}

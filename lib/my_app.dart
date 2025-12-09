import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:meu_app/pages/main_page.dart';
import 'package:meu_app/pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        dialogTheme: DialogThemeData(
          backgroundColor: const Color(0xFF153447),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xFF153447),
        textTheme: GoogleFonts.robotoTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),

        primaryColor: const Color.fromARGB(255, 86, 213, 124),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 86, 213, 124),
          foregroundColor: Color.fromARGB(255, 21, 52, 71),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 4,
          centerTitle: true,
        ),
      ),
      home: const LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YANSHTER STORE',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF23272F),
        cardColor: const Color(0xFF2C313A),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFB71C1C),
          secondary: const Color(0xFFFFD600),
          surface: const Color.fromARGB(255, 29, 31, 36),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 31, 32, 36),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xFFB71C1C)),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
            ),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF23272F),
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white70),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

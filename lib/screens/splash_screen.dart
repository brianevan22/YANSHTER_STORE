import 'dart:async';
import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1800), () {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_psht.png', width: 120, height: 120),
            const SizedBox(height: 20),
            const Text(
              'Fyank Store - Atribut PSHT',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Memuat...', style: TextStyle(color: Colors.white70)),
            const SizedBox(height: 24),
            const Text(
              'Pembuat: Brian Evan Fahrezy',
              style: TextStyle(fontSize: 16, color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}

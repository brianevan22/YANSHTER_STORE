import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login_page.dart'; // pastikan ada file login_page.dart

class TerimakasihPage extends StatelessWidget {
  final String nama;

  const TerimakasihPage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.yellow, size: 80),
            const SizedBox(height: 24),
            const Text(
              "Terima kasih sudah berbelanja Masht/Mbak!",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                // balik ke HomeScreen tapi keranjang kosong
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => HomeScreen(nama: nama)),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.shopping_bag),
              label: const Text("Beli Barang Lain"),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {
                // keluar dari sesi belanja → kembali ke LoginPage
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.exit_to_app),
              label: const Text("Keluar Aplikasi"),
            ),
          ],
        ),
      ),
    );
  }
}

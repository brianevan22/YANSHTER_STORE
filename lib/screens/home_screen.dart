import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:badges/badges.dart' as badges;
import '../models/base_item.dart';
import 'kategori_screen.dart';
import 'keranjang_page.dart';
import 'login_page.dart';

class HomeScreen extends StatefulWidget {
  final String nama;
  const HomeScreen({super.key, required this.nama});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> keranjang = [];

  void addToKeranjang(BaseItem item, int jumlah, String? ukuran) {
    setState(() {
      keranjang.add({"item": item, "jumlah": jumlah, "ukuran": ukuran});
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${item.nama} ditambahkan ke keranjang")),
    );
  }

  void removeFromKeranjang(int index) {
    setState(() {
      keranjang.removeAt(index);
    });
  }

  Future<void> _logout() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2C),
        title: const Text(
          "Konfirmasi Logout",
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          "Apakah kamu yakin ingin keluar?",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            child: const Text("Batal", style: TextStyle(color: Colors.white70)),
            onPressed: () => Navigator.pop(context, false),
          ),
          TextButton(
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.redAccent),
            ),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('email');

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final namaUser = widget.nama.contains("@")
        ? widget.nama.split("@")[0]
        : widget.nama;

    final kategori = [
      {"id": "sakral", "nama": "Sakral"},
      {"id": "sabuk", "nama": "Sabuk"},
      {"id": "kaos", "nama": "Kaos"},
      {"id": "hoodie", "nama": "Hoodie"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E1E1E),
        automaticallyImplyLeading: false,
        leadingWidth: 60,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.white, size: 28),
          tooltip: "Logout",
          onPressed: _logout,
        ),
        title: Text(
          "Selamat Datang, $namaUser",
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          // ✅ Badge keranjang pakai library badges
          badges.Badge(
            showBadge: keranjang.isNotEmpty,
            badgeContent: Text(
              '${keranjang.length}',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
            badgeStyle: const badges.BadgeStyle(
              badgeColor: Colors.redAccent,
              padding: EdgeInsets.all(6),
            ),
            position: badges.BadgePosition.topEnd(top: 6, end: 6),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 28,
              ),
              tooltip: "Keranjang",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KeranjangPage(
                      keranjang: keranjang,
                      nama: widget.nama,
                      onRemove: removeFromKeranjang,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: kategori.length,
        itemBuilder: (context, index) {
          final data = kategori[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: const Color.fromARGB(255, 34, 37, 39),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              title: Text(
                data['nama']!,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
              ),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => KategoriScreen(
                      kategori: data['id']!,
                      nama: widget.nama,
                    ),
                  ),
                );
                if (result != null && result is Map<String, dynamic>) {
                  addToKeranjang(
                    result['item'],
                    result['jumlah'],
                    result['ukuran'],
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}

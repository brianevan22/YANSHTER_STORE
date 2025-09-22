import 'package:flutter/material.dart';
import '../models/base_item.dart';
import 'kategori_screen.dart';
import 'keranjang_page.dart';

class HomeScreen extends StatefulWidget {
  final String nama; // ini berupa email
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

  @override
  Widget build(BuildContext context) {
    // Ambil nama sebelum tanda @ dari email
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
        title: Text("Selamat Datang, $namaUser"),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
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
              if (keranjang.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      "${keranjang.length}",
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
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

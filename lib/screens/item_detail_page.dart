import 'package:flutter/material.dart';
import '../models/base_item.dart';

class ItemDetailPage extends StatefulWidget {
  final BaseItem item;
  final String nama;
  const ItemDetailPage({super.key, required this.item, required this.nama});

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  int jumlah = 1;
  String? ukuran;
  String? errorUkuran;

  List<String> getUkuranList() {
    switch (widget.item.getKategori()) {
      case "Sakral":
      case "Kaos":
      case "Hoodie":
        return ["S", "M", "L", "XL"];
      default: // Sabuk & kategori lain tanpa ukuran
        return [];
    }
  }

  void tambahKeranjang() {
    final ukuranList = getUkuranList();
    if (ukuranList.isNotEmpty && ukuran == null) {
      setState(() {
        errorUkuran = "Ukuran wajib dipilih!";
      });
      return;
    }
    Navigator.pop(context, {
      'item': widget.item,
      'jumlah': jumlah,
      'ukuran': ukuran,
    });
  }

  @override
  Widget build(BuildContext context) {
    final ukuranList = getUkuranList();
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.nama)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          color: Theme.of(context).cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(widget.item.kodeGambar, width: 300, height: 300),
                const SizedBox(height: 16),
                Text(
                  widget.item.nama,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.item.getKategori(),
                  style: const TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.item.deskripsi,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  "Rp${widget.item.harga}",
                  style: const TextStyle(fontSize: 20, color: Colors.yellow),
                ),
                const SizedBox(height: 24),

                // Dropdown ukuran (hanya kalau ada)
                if (ukuranList.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: DropdownButtonFormField<String>(
                      value: ukuran,
                      decoration: const InputDecoration(
                        labelText: "Pilih Ukuran",
                      ),
                      items: ukuranList
                          .map(
                            (u) => DropdownMenuItem(value: u, child: Text(u)),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          ukuran = value;
                          errorUkuran = null;
                        });
                      },
                    ),
                  ),
                if (errorUkuran != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      errorUkuran!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                if (ukuranList.isNotEmpty) const SizedBox(height: 16),

                // Jumlah
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: jumlah > 1
                          ? () => setState(() => jumlah--)
                          : null,
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.redAccent,
                      ),
                    ),
                    Text(
                      '$jumlah',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () => setState(() => jumlah++),
                      icon: const Icon(
                        Icons.add_circle,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // Tombol tambah keranjang
                ElevatedButton.icon(
                  onPressed: tambahKeranjang,
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text("Tambah ke Keranjang"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/base_item.dart';
import 'checkout_page.dart';

class KeranjangPage extends StatefulWidget {
  final List<Map<String, dynamic>> keranjang;
  final String nama;
  final Function(int) onRemove;

  const KeranjangPage({
    super.key,
    required this.keranjang,
    required this.nama,
    required this.onRemove,
  });

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  int getTotal() {
    int total = 0;
    for (var data in widget.keranjang) {
      total += (data['item'] as BaseItem).harga * (data['jumlah'] as int);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang")),
      body: widget.keranjang.isEmpty
          ? const Center(
              child: Text(
                "Keranjang kosong",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: widget.keranjang.length,
              itemBuilder: (context, index) {
                final data = widget.keranjang[index];
                final item = data['item'] as BaseItem;
                final jumlah = data['jumlah'] as int;
                final ukuran = data['ukuran'];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 12,
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      item.kodeGambar,
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      item.nama,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (ukuran != null)
                          Text(
                            "Ukuran: $ukuran",
                            style: const TextStyle(color: Colors.white70),
                          ),
                        Text(
                          "Jumlah: $jumlah",
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "Rp${item.harga} x $jumlah = Rp${item.harga * jumlah}",
                          style: const TextStyle(color: Colors.yellow),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        widget.onRemove(index);
                        setState(() {}); // update UI setelah hapus
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "${item.nama} dihapus dari keranjang",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: widget.keranjang.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CheckoutPage(
                        keranjang: widget.keranjang
                            .map<Map<BaseItem, int>>(
                              (data) => {
                                data['item'] as BaseItem: data['jumlah'] as int,
                              },
                            )
                            .toList(),
                        total: getTotal(),
                        nama: widget.nama,
                      ),
                    ),
                  );
                },
                child: Text("Checkout (Rp${getTotal()})"),
              ),
            ),
    );
  }
}

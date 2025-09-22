import 'package:flutter/material.dart';
import '../models/base_item.dart';
import 'terimakasih_page.dart';

class CheckoutPage extends StatefulWidget {
  final List<Map<BaseItem, int>> keranjang;
  final int total;
  final String nama;
  const CheckoutPage({
    super.key,
    required this.keranjang,
    required this.total,
    required this.nama,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _alamatController = TextEditingController();
  String _pembayaran = "qris";

  @override
  void initState() {
    super.initState();
    _namaController.text = widget.nama;
  }

  @override
  void dispose() {
    _namaController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  void _checkout() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const TerimakasihPage(nama: '')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              ...widget.keranjang.map((itemMap) {
                final item = itemMap.keys.first;
                final jumlah = itemMap.values.first;
                return ListTile(
                  leading: Image.asset(item.kodeGambar, width: 40, height: 40),
                  title: Text(
                    item.nama,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "Rp${item.harga} x $jumlah = Rp${item.harga * jumlah}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                );
              }),
              const Divider(),
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(labelText: "Nama"),
                style: const TextStyle(color: Colors.white),
                validator: (value) =>
                    value == null || value.isEmpty ? "Nama wajib diisi" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _alamatController,
                decoration: const InputDecoration(labelText: "Alamat"),
                style: const TextStyle(color: Colors.white),
                validator: (value) => value == null || value.isEmpty
                    ? "Alamat wajib diisi"
                    : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _pembayaran,
                decoration: const InputDecoration(labelText: "Via Pembayaran"),
                style: const TextStyle(color: Colors.white),
                items: const [
                  DropdownMenuItem(value: "qris", child: Text("QRIS")),
                  DropdownMenuItem(value: "bca", child: Text("Bank BCA")),
                  DropdownMenuItem(
                    value: "mandiri",
                    child: Text("Bank Mandiri"),
                  ),
                  DropdownMenuItem(value: "bri", child: Text("Bank BRI")),
                  DropdownMenuItem(value: "cod", child: Text("COD")),
                ],
                onChanged: (value) {
                  setState(() {
                    _pembayaran = value ?? "qris";
                  });
                },
              ),
              const SizedBox(height: 24),
              Text(
                "Total: Rp${widget.total}",
                style: const TextStyle(fontSize: 18, color: Colors.yellow),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _checkout,
                child: const Text("Bayar & Selesai"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

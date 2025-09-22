import 'package:flutter/material.dart';
import '../models/sakral.dart';
import '../models/sabuk.dart';
import '../models/kaos.dart';
import '../models/hoodie.dart';
import '../models/base_item.dart';
import 'item_detail_page.dart';

class KategoriScreen extends StatelessWidget {
  final String kategori;
  final String nama;
  const KategoriScreen({super.key, required this.kategori, required this.nama});

  List<BaseItem> getItems() {
    switch (kategori) {
      case "sakral":
        return [
          Sakral(
            id: "sakral1",
            nama: "Sakral Siswa",
            deskripsi: "Sakral latihan untuk siswa PSHT.",
            harga: 100000,
            kodeGambar: "assets/sakral_siswa.png",
          ),
          Sakral(
            id: "sakral2",
            nama: "Sakral Warga",
            deskripsi: "Atribut sakral untuk warga PSHT.",
            harga: 150000,
            kodeGambar: "assets/sakral_warga.png",
          ),
        ];
      case "sabuk":
        return [
          Sabuk(
            id: "sabuk1",
            nama: "Sabuk Polos",
            deskripsi: "Sabuk polos PSHT.",
            harga: 50000,
            kodeGambar: "assets/sabuk_polos.png",
          ),
          Sabuk(
            id: "sabuk2",
            nama: "Sabuk Jambon",
            deskripsi: "Sabuk jambon PSHT.",
            harga: 60000,
            kodeGambar: "assets/sabuk_jambon.png",
          ),
          Sabuk(
            id: "sabuk3",
            nama: "Sabuk Hijau",
            deskripsi: "Sabuk hijau PSHT.",
            harga: 70000,
            kodeGambar: "assets/sabuk_hijau.png",
          ),
          Sabuk(
            id: "sabuk4",
            nama: "Sabuk Putih",
            deskripsi: "Sabuk putih PSHT.",
            harga: 80000,
            kodeGambar: "assets/sabuk_putih.png",
          ),
          Sabuk(
            id: "sabuk5",
            nama: "Sabuk Mori",
            deskripsi: "Sabuk mori PSHT.",
            harga: 90000,
            kodeGambar: "assets/sabuk_mori.png",
          ),
        ];
      case "kaos":
        return [
          Kaos(
            id: "kaos1",
            nama: "Kaos PSHT",
            deskripsi: "Kaos Pakem PSHT - Khusus Warga PSHT.",
            harga: 100000,
            kodeGambar: "assets/kaos_psht.png",
          ),
          Kaos(
            id: "kaos2",
            nama: "Kaos Serdadu Madiun",
            deskripsi: "Kaos Serdadu Sektor Madiun - Khusus Warga PSHT.",
            harga: 110000,
            kodeGambar: "assets/kaos_serdadu.png",
          ),
          Kaos(
            id: "kaos3",
            nama: "Kaos Boshter Perbatasan",
            deskripsi: "Kaos Boshter Wilayah Perbatasan - Khusus Warga PSHT.",
            harga: 120000,
            kodeGambar: "assets/kaos_boshter.png",
          ),
          Kaos(
            id: "kaos4",
            nama: "Kaos Terjal",
            deskripsi: "Kaos Terate Jalanan - Khusus Warga PSHT.",
            harga: 130000,
            kodeGambar: "assets/kaos_terjal.png",
          ),
        ];
      case "hoodie":
        return [
          Hoodie(
            id: "hoodie1",
            nama: "Hoodie Sweeper 21",
            deskripsi: "Hoodie Pemuda Hijrah - Khusus Warga PSHT.",
            harga: 200000,
            kodeGambar: "assets/hoodie_sweeper21.png",
          ),
          Hoodie(
            id: "hoodie2",
            nama: "Hoodie Hooligans Pembantai",
            deskripsi: "Hoodie Hooligans Pembantai - Khusus Warga PSHT.",
            harga: 210000,
            kodeGambar: "assets/hoodie_hooligans_pembantai.png",
          ),
          Hoodie(
            id: "hoodie3",
            nama: "Hoodie Begaleaty",
            deskripsi: "Hoodie Begaleaty - Khusus Warga PSHT.",
            harga: 220000,
            kodeGambar: "assets/hoodie_begaleaty.png",
          ),
        ];
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = getItems();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List ${kategori[0].toUpperCase()}${kategori.substring(1)}",
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.asset(item.kodeGambar, width: 48, height: 48),
              title: Text(
                item.nama,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                "Rp${item.harga}",
                style: const TextStyle(color: Colors.yellow),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
              ),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ItemDetailPage(item: item, nama: nama),
                  ),
                );
                if (result != null && result is Map<String, dynamic>) {
                  Navigator.pop(context, result); // kirim balik ke HomeScreen
                }
              },
            ),
          );
        },
      ),
    );
  }
}

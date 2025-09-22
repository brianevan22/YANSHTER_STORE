class BaseItem {
  final String id;
  final String nama;
  final String deskripsi;
  final int harga;
  final String kodeGambar;

  BaseItem({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.kodeGambar,
  });

  String getKategori() => "Item";
}

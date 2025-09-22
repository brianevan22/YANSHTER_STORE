import 'base_item.dart';

class Kaos extends BaseItem {
  Kaos({
    required String id,
    required String nama,
    required String deskripsi,
    required int harga,
    required String kodeGambar,
  }) : super(
         id: id,
         nama: nama,
         deskripsi: deskripsi,
         harga: harga,
         kodeGambar: kodeGambar,
       );

  @override
  String getKategori() => "Kaos";
}

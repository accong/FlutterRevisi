class TempatPariwisata {
  final int id;
  final String gambar;
  final String nama_tempat;
  final String deskripsi;
  final String lokasi;
  final String catering;

  TempatPariwisata(
      {required this.id,
      required this.gambar,
      required this.nama_tempat,
      required this.deskripsi,
      required this.lokasi,
      required this.catering});

  factory TempatPariwisata.fromJSON(Map<String, dynamic> json) {
    return TempatPariwisata(
        id: json["id"],
        gambar: json["gambar"],
        nama_tempat: json["nama_tempat"],
        deskripsi: json["deskripsi"],
        lokasi: json["lokasi"],
        catering: json["catering"]);
  }
}

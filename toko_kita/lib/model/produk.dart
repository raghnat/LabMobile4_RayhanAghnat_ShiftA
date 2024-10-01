class Produk {
  int? id;
  String? kodeProduk;
  String? namaProduk;
  int? hargaProduk;

  Produk(
    this.id,
    this.kodeProduk,
    this.namaProduk,
    this.hargaProduk,
  );

  factory Produk.fromJson(Map<String, dynamic> obj) {
    return Produk(
      obj['id'],
      obj['kode_produk'],
      obj['nama_produk'],
      obj['harga'],
    );
  }
}

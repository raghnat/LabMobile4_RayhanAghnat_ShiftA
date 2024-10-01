import 'package:flutter/material.dart';
import 'package:toko_kita/model/produk.dart';
import 'package:toko_kita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  final Produk? produk;

  const ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Detail Produk Rehan',
            style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kode : ${widget.produk?.kodeProduk ?? '-'}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk?.namaProduk ?? '-'}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk?.hargaProduk?.toString() ?? '-'}",
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 20),
            _tombolHapusEdit(),
          ],
        ),
      ),
    );
  }

  // Widget untuk tombol Edit dan Hapus
  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          child: const Text("EDIT"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(produk: widget.produk),
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        // Tombol Hapus
        OutlinedButton(
          child: const Text("DELETE"),
          onPressed: confirmHapus,
        ),
      ],
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi hapus
  void confirmHapus() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            // Tombol hapus
            OutlinedButton(
              child: const Text("Ya"),
              onPressed: () {
                // Logika hapus data di sini
                // Misal: menghapus produk dari database

                // Setelah hapus, kembali ke halaman sebelumnya
                Navigator.pop(context); // Tutup dialog
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
            ),
            // Tombol batal
            OutlinedButton(
              child: const Text("Batal"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }
}

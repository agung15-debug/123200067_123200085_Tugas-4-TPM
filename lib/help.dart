import 'package:flutter/material.dart';

class Panduan extends StatelessWidget {
  const Panduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Panduan Penggunaan"),
            backgroundColor: Colors.green,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        "Panduan Penggunaan",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                      '1. Login terlebih dahulu dengan username \'admin\' dan password \'admin\''),
                  SizedBox(height: 10),
                  Text('2. Pilih menu yang diinginkan'),
                  SizedBox(height: 10),
                  Text(
                      '3. Menu Daftar Anggota, berisi anggota kelompok berikut gambaran dari menu daftar anggota :'),
                  Image(image: AssetImage('images/anggota.png')),
                  SizedBox(height: 10),
                  Text('4. Menu Stopwatch, berikut gambar menu nya'),
                  Image(image: AssetImage('images/Stopwatch.png')),
                  Text(
                      'Pada menu ini terdapat 3 tombol yaitu : Start/Pause, Stop dan Flag. Untuk melakukan penghitungan waktu, tekan tombol Start/Pause, untuk menghentikan penghitungan waktu, tekan tombol Stop, dan untuk menandai waktu yang telah dihitung, tekan tombol Flag.'),
                  SizedBox(height: 10),
                  Text('5. Menu Rekomendasi, berikut gambar menu nya'),
                  Image(image: AssetImage('images/rekomendasi.png')),
                  Text(
                      'Pada Menu ini berisi Card - Card yang berisi gambar, nama aplikasi dan link dari aplikasi. Ketika card ini diklik maka akan membuka link dari aplikasi tersebut.'),
                  SizedBox(height: 10),
                  Text('6. Menu Favorite, berikut gambar menu nya'),
                  Image(image: AssetImage('images/favorite.png')),
                  Text(
                      'Pada Menu ini berisi Card - Card yang berisi gambar, nama aplikasi dan link dari aplikasi favorite penulis program. Ketika card ini diklik maka akan membuka link dari aplikasi tersebut.'),
                ],
              ),
            ),
          )),
    );
  }
}

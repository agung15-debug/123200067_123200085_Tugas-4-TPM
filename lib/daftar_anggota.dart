import 'package:flutter/material.dart';

class DaftarAnggota extends StatefulWidget {
  const DaftarAnggota({Key? key}) : super(key: key);

  @override
  State<DaftarAnggota> createState() => _DaftarAnggotaState();
}

class _DaftarAnggotaState extends State<DaftarAnggota> {
  List<String> nama = ['Agung Prayogi', 'Ilham Kurniawan'];
  List<String> nim = ['123200085', '123200067'];
  List<String> imgProfiles = ['images/agung.jpg', 'images/ilham.jpg'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Daftar Anggota'),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: Center(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          imgProfiles[index],
                          height: 480,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                nama[index],
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.black),
                              ),
                              Text(
                                nim[index],
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )));
  }
}

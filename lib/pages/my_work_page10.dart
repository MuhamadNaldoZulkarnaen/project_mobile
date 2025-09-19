import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Fungsi tombol baca info
Container _tombolBaca() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.orange, borderRadius: BorderRadius.circular(15)),
    child: const Text(
      'Baca Info',
      style: TextStyle(color: Colors.white),
    ),
  );
}

// Fungsi list item game
Container _listItem(String url, String judul, String genre, String rilis) {
  return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              url,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                judul,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(genre, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 2),
                      Text(rilis, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  _tombolBaca()
                ],
              )
            ]),
          ),
        ],
      ));
}

class MyWorkPage10 extends StatefulWidget {
  const MyWorkPage10({super.key});

  @override
  State<MyWorkPage10> createState() => _MyWorkPage10State();
}

class _MyWorkPage10State extends State<MyWorkPage10> {
  List<dynamic> dataGame = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  // Method untuk request data ke server dengan API FreeToGame
  Future _ambilData() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.freetogame.com/api/games'),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          // Simpan hanya 20 data pertama dari API ke List
          dataGame = data.take(20).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Gagal load data dari FreeToGame API');
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _error = 'Terjadi kesalahan: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Game (API FreeToGame)'),
        backgroundColor: Colors.amber,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!, style: const TextStyle(color: Colors.red)))
              : ListView.builder(
                  itemCount: dataGame.length,
                  itemBuilder: (context, index) {
                    return _listItem(
                      dataGame[index]['thumbnail'] ?? 'https://via.placeholder.com/150',
                      dataGame[index]['title'] ?? 'Tidak ada judul',
                      dataGame[index]['genre'] ?? 'Tidak ada genre',
                      dataGame[index]['release_date'] ?? 'Tidak ada tanggal',
                    );
                  },
                ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWorkPage9 extends StatefulWidget {
  const MyWorkPage9({super.key});

  @override
  State<MyWorkPage9> createState() => _MyWorkPage9State();
}

class _MyWorkPage9State extends State<MyWorkPage9> {
  List<dynamic> dataBerita = [];
  bool _isLoading = true;
  String? _error;

  // Ganti dengan API key GNews Anda sendiri (daftar gratis di https://gnews.io/)
  final String apiKey = 'b9629a0ca72e161754513965e237eb0f';

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final url = Uri.parse('https://gnews.io/api/v4/top-headlines?lang=id&token=$apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          dataBerita = data['articles'] ?? [];
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Gagal memuat data: ${response.statusCode}';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Terjadi kesalahan: $e';
        _isLoading = false;
      });
    }
  }

  Widget newsTile(Map<String, dynamic> item) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: Colors.amber.shade100,
        child: GridTile(
          footer: SizedBox(
            height: 45,
            child: GridTileBar(
              backgroundColor: Colors.black38,
              title: Text(
                item['title'] ?? '-',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          child: item['image'] != null && item['image'].toString().isNotEmpty
              ? Image.network(
                  item['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image, size: 48),
                )
              : const Icon(Icons.broken_image, size: 48),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Berita (API ListView)'),
        backgroundColor: Colors.amber,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!, style: const TextStyle(color: Colors.red)))
              : ListView.builder(
                  itemCount: dataBerita.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          title: Text(
                            dataBerita[index]['title'] ?? "Tidak ada judul",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            dataBerita[index]['publishedAt'] ?? dataBerita[index]['published_at'] ?? "Tidak ada data",
                            maxLines: 1,
                            style: const TextStyle(fontSize: 16),
                          ),
                          leading: Image.network(
                            dataBerita[index]['image'] ??
                                'http://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg',
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyWorkPage8 extends StatefulWidget {
  const MyWorkPage8({super.key});

  @override
  State<MyWorkPage8> createState() => _MyWorkPage8State();
}

class _MyWorkPage8State extends State<MyWorkPage8> {
  List<dynamic> _news = [];
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
          _news = data['articles'] ?? [];
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
        title: const Text('Berita (API GridView)'),
        backgroundColor: Colors.amber,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text(_error!, style: const TextStyle(color: Colors.red)))
              : GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: _news.length,
                  itemBuilder: (context, index) {
                    return newsTile(_news[index]);
                  },
                ),
    );
  }
}

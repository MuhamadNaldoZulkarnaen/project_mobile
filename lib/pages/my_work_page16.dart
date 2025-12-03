import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Data arguments untuk dikirim ke halaman detail
class ScreenArguments {
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;

  ScreenArguments(this.title, this.subtitle, this.description, this.imageUrl);
}

class MyWorkPage16 extends StatelessWidget {
  const MyWorkPage16({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        Tujuan.routeName: (context) => const Tujuan(),
      },
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic>? game;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchGame();
  }

  Future<void> fetchGame() async {
    final url = Uri.parse('https://www.freetogame.com/api/game?id=452'); // Forza Motorsport 6: Apex
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          game = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: const Text("Halaman Home"),
        backgroundColor: Colors.blue[700],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : game == null
                ? const Text("Gagal memuat data game")
                : Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      width: 340,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              game!['thumbnail'] ?? '',
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            game!['title'] ?? '',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Genre: ${game!['genre'] ?? ''}\nPublisher: ${game!['publisher'] ?? ''}\nPlatform: ${game!['platform'] ?? ''}   Release: ${game!['release_date'] ?? ''}",
                            style: const TextStyle(fontSize: 14),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                            ),
                            onPressed: () {
                              final args = ScreenArguments(
                                game!['title'] ?? '',
                                "Genre: ${game!['genre'] ?? ''} | Publisher: ${game!['publisher'] ?? ''}",
                                game!['description'] ?? '',
                                game!['thumbnail'] ?? '',
                              );
                              Navigator.pushNamed(
                                context,
                                Tujuan.routeName,
                                arguments: args,
                              );
                            },
                            child: const Text("Lihat Detail"),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}

class Tujuan extends StatelessWidget {
  const Tujuan({super.key});

  static const routeName = '/tujuan';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;

    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        title: const Text("Halaman Detail"),
        backgroundColor: Colors.orange[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    args.imageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  args.title,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  args.subtitle,
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  args.description,
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Kembali ke Home'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
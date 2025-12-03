

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyWorkPage19 extends StatelessWidget {
  const MyWorkPage19({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Game Store',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/detail': (context) {
          final gameId = ModalRoute.of(context)!.settings.arguments as int;
          return Detail(gameTerpilih: gameId);
        },
      },
    );
  }
}

// Dummy model for Game
class Game {
  final int id;
  final String title;
  final String thumbnail;
  final String genre;
  Game({required this.id, required this.title, required this.thumbnail, required this.genre});
}

// Dummy fetchGames function
Future<List<Game>> fetchGames() async {
  await Future.delayed(const Duration(seconds: 1));
  return List.generate(
    10,
    (i) => Game(
      id: i,
      title: 'Game $i',
      thumbnail: 'https://picsum.photos/id/${i + 10}/300/200', // Gambar random
      genre: 'Genre $i',
    ),
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Game>> gameList;

  @override
  void initState() {
    super.initState();
    gameList = fetchGames();
  }

  TextField _searchBar() {
    return TextField(
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        fillColor: Colors.blue.shade50,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        prefixIcon: const Icon(Icons.search_outlined, color: Colors.blue, size: 30),
        hintText: 'Cari game',
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(0.7)),
      ),
    );
  }

  Card _listItem(String urlCover, String judul, String genre) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        tileColor: Colors.blue.shade50,
        leading: SizedBox(
          width: 75,
          height: 75,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(urlCover, scale: 3, fit: BoxFit.cover),
          ),
        ),
        title: Text(judul),
        subtitle: Text(genre),
        trailing: const Icon(Icons.more_vert),
        isThreeLine: false,
        titleAlignment: ListTileTitleAlignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            children: [
              _searchBar(),
              const SizedBox(height: 10),
              FutureBuilder<List<Game>>(
                future: gameList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('Tidak ada data game.');
                  } else {
                    final games = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: games.length,
                        itemBuilder: (context, index) {
                          final game = games[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/detail',
                                arguments: game.id,
                              );
                            },
                            child: _listItem(
                              game.thumbnail,
                              game.title,
                              game.genre,
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Detail extends StatelessWidget {
  final int gameTerpilih;
  const Detail({super.key, required this.gameTerpilih});

  Future<Game> fetchData() async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Dummy detail, in real app fetch from API
    return Game(
      id: gameTerpilih,
      title: 'Game $gameTerpilih',
      thumbnail: 'https://picsum.photos/id/${gameTerpilih + 10}/300/200', // Gambar random
      genre: 'Genre $gameTerpilih',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      body: FutureBuilder<Game>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Data tidak tersedia'));
          } else {
            final game = snapshot.data!;
            return Column(
              children: [
                const SizedBox(height: 40),
                const Text('Detail Game', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Image.network(game.thumbnail, height: 200),
                const SizedBox(height: 20),
                Text(game.title, style: const TextStyle(fontSize: 20)),
                Text(game.genre, style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
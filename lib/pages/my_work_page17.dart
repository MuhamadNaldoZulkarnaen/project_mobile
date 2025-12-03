import 'package:flutter/material.dart';

class MyWorkPage17 extends StatelessWidget {
  const MyWorkPage17({super.key});

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
    return const MaterialApp(
      title: 'Stateful Widget Demo',
      home: SwitchPage(),
    );
  }
}

// Halaman utama dengan tombol switch
class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  bool showCounter = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Demo Switch Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showCounter = !showCounter;
                });
              },
              child: Text(
                showCounter ? 'Switch ke Like Button' : 'Switch ke Counter App',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: showCounter
                ? const CounterPage()
                : const LikeButtonPage(),
          ),
        ],
      ),
    );
  }
}

// Percobaan 1 – Counter App
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0; // state

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Klik tombol tambah atau kurang:',
            style: TextStyle(fontSize: 24),
          ),
          Text(
            '$_counter',
            style: const TextStyle(fontSize: 40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700]!,
                  minimumSize: const Size(100, 60),
                ),
                onPressed: _decrementCounter,
                child: const Text(
                  'Kurang',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700]!,
                  minimumSize: const Size(100, 60),
                ),
                onPressed: _incrementCounter,
                child: const Text(
                  'Tambah',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Percobaan 2 – Like Button
class LikeButtonPage extends StatefulWidget {
  const LikeButtonPage({super.key});

  @override
  State<LikeButtonPage> createState() => _LikeButtonPageState();
}

class _LikeButtonPageState extends State<LikeButtonPage> {
  bool _isLiked = false; // state untuk status like
  int _likeCount = 10;

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likeCount--;
        _isLiked = false;
      } else {
        _likeCount++;
        _isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(
              _isLiked ? Icons.favorite : Icons.favorite_border,
              color: _isLiked ? Colors.red : Colors.grey,
              size: 48,
            ),
            onPressed: _toggleLike,
          ),
          Text('$_likeCount likes'),
        ],
      ),
    );
  }
}
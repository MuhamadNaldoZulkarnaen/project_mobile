import 'package:flutter/material.dart';

class MyWorkPage extends StatelessWidget {
  const MyWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Work')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            KotakBiruJempol(),
            SizedBox(height: 16),
            KotakBiruJempol(),
            SizedBox(height: 16),
            KotakBiruJempol(),
          ],
        ),
      ),
    );
  }
}

// Langkah 2 - Widget kustom kotak biru dengan icon jempol
class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

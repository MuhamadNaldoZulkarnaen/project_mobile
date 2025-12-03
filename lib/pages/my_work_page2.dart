import 'package:flutter/material.dart';

class MyWorkPage2 extends StatelessWidget {
  const MyWorkPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alignment')),
      body: const Center(
        // Aktifkan hanya satu child di bawah ini untuk eksperimen layout:
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            KotakBiruJempolKecil(),
            SizedBox(width: 20),
            KotakBiruJempol(),
            SizedBox(width: 20),
            KotakBiruJempolKecil(),
          ],
        ),
        /*
        // Row mainAxisSize.min
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            KotakBiruJempolKecil(),
            SizedBox(width: 20),
            KotakBiruJempol(),
            SizedBox(width: 20),
            KotakBiruJempolKecil(),
          ],
        ),

        // Column mainAxisSize.max
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: const [
            KotakBiruJempolKecil(),
            SizedBox(height: 20),
            KotakBiruJempol(),
            SizedBox(height: 20),
            KotakBiruJempolKecil(),
          ],
        ),

        // Column mainAxisSize.min
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            KotakBiruJempolKecil(),
            SizedBox(height: 20),
            KotakBiruJempol(),
            SizedBox(height: 20),
            KotakBiruJempolKecil(),
          ],
        ),

        // Row mainAxisAlignment
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            KotakBiruJempolKecil(),
            KotakBiruJempol(),
            KotakBiruJempolKecil(),
          ],
        ),

        // Row crossAxisAlignment
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            KotakBiruJempolKecil(),
            KotakBiruJempol(),
            KotakBiruJempolKecil(),
          ],
        ),

        // Row dengan Text dan Icon
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Text('Suhu:', style: TextStyle(fontSize: 30)),
            Text('25\u00B0C', style: TextStyle(fontSize: 75)),
            Icon(Icons.sunny, color: Colors.amber, size: 45),
          ],
        ),

        // Row baseline
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: const [
            Text('Suhu:', style: TextStyle(fontSize: 30)),
            Text('25\u00B0C', style: TextStyle(fontSize: 75)),
            Icon(Icons.sunny, color: Colors.amber, size: 45),
          ],
        ),
        */
      ),
    );
  }
}

class KotakBiruJempol extends StatelessWidget {
  const KotakBiruJempol({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

class KotakBiruJempolKecil extends StatelessWidget {
  const KotakBiruJempolKecil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.thumb_up,
        color: Colors.white,
        size: 40,
      ),
    );
  }
}

import 'package:flutter/material.dart';


class WorkListPage4 extends StatelessWidget {
  const WorkListPage4({super.key});

  // Percobaan 2: Method _kotakUji
  Container _kotakUji(Color warna, double tinggi, String teks) {
    return Container(
      width: double.infinity,
      height: tinggi,
      color: warna,
      alignment: const Alignment(0.0, 0.0),
      child: Text(
        teks,
        style: const TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flexible',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flexible')),
        // === Percobaan 1: Flexible ===
        /*
        body: const Center(
          child: Row(
            children: [
              Flexible(flex: 1, child: KotakBiruJempolKecil()),
              Flexible(flex: 3, child: KotakBiruJempolKecil()),
              Flexible(flex: 2, child: KotakBiruJempolKecil()),
            ],
          ),
        ),
        */

        // === Percobaan 1g: Flexible fit: FlexFit.tight ===
        /*
        body: const Center(
          child: Row(
            children: [
              Flexible(fit: FlexFit.tight, flex: 1, child: KotakBiruJempolKecil()),
              Flexible(fit: FlexFit.tight, flex: 3, child: KotakBiruJempolKecil()),
              Flexible(fit: FlexFit.tight, flex: 2, child: KotakBiruJempolKecil()),
            ],
          ),
        ),
        */

        // === Percobaan 1i: Flexible campuran tight & loose ===
        /*
        body: const Center(
          child: Row(
            children: [
              Flexible(fit: FlexFit.tight, flex: 1, child: KotakBiruJempolKecil()),
              Flexible(fit: FlexFit.tight, flex: 3, child: KotakBiruJempolKecil()),
              Flexible(fit: FlexFit.loose, flex: 2, child: KotakBiruJempolKecil()),
            ],
          ),
        ),
        */

        // === Percobaan 2: Expanded & Flexible ===
        /*
        body: Column(
          children: [
            _kotakUji(Colors.amber, 150, 'Normal'),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: _kotakUji(Colors.green, 100, 'Flexible'),
            ),
            Expanded(flex: 1, child: _kotakUji(Colors.blue, 250, 'Expanded')),
          ],
        ),
        */

        // === Percobaan 2g: Semua tanpa Flexible/Expanded ===
        /*
        body: Column(
          children: [
            _kotakUji(Colors.amber, 150, 'Normal'),
            _kotakUji(Colors.green, 100, 'Flexible'),
            _kotakUji(Colors.blue, 250, 'Expanded'),
          ],
        ),
        */

        // === Percobaan 2h: Flexible loose & Expanded ===
        body: Column(
          children: [
            _kotakUji(Colors.amber, 150, 'Normal'),
            Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: _kotakUji(Colors.green, 100, 'Flexible'),
            ),
            Expanded(flex: 2, child: _kotakUji(Colors.blue, 250, 'Expanded')),
          ],
        ),
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

import 'package:flutter/material.dart';

class MyWorkPage extends StatelessWidget {
  const MyWorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Work')),
      body: const Center(
        child: Text(
          'Ini halaman My Work.\nSilakan tambahkan daftar tugas atau pekerjaan Anda di sini.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

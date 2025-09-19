import 'package:flutter/material.dart';

class MyWorkPage7 extends StatelessWidget {
  const MyWorkPage7({super.key});

  // Method tile versi ListView
  Widget tile(Color warnaKotak, String gambar, String judul) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: warnaKotak,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                gambar,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                judul,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo ListView'),
        backgroundColor: Colors.amber,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          tile(Colors.blueAccent.shade400, 'assets/icon/boy.png', 'Kehadiran'),
          const SizedBox(height: 10),
          tile(Colors.greenAccent.shade400, 'assets/icon/timetable.png', 'Jadwal Kuliah'),
          const SizedBox(height: 10),
          tile(Colors.yellowAccent.shade400, 'assets/icon/homeschooling.png', 'Tugas'),
          const SizedBox(height: 10),
          tile(Colors.redAccent.shade400, 'assets/icon/checklist.png', 'Pengumuman'),
          const SizedBox(height: 10),
          tile(Colors.purpleAccent.shade400, 'assets/icon/grades.png', 'Nilai'),
          const SizedBox(height: 10),
          tile(Colors.tealAccent.shade400, 'assets/icon/pencil.png', 'Catatan'),
        ],
      ),
    );
  }
}

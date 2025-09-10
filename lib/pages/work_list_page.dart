import 'package:flutter/material.dart';
import 'my_work_page.dart';
import 'my_work_page2.dart';
import 'my_work_page3.dart';

class WorkListPage extends StatelessWidget {
  const WorkListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Work')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.book, color: Colors.deepPurple),
            title: const Text('Modul 2'),
            subtitle: const Text('Tugas dan latihan modul 2'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book, color: Colors.indigo),
            title: const Text('Modul 3'),
            subtitle: const Text('Tugas dan latihan modul 3'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage2(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment, color: Colors.teal),
            title: const Text('Tugas Modul 3'),
            subtitle: const Text('Halaman tugas khusus Modul 3'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage3(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
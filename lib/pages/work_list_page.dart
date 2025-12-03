import 'package:flutter/material.dart';
import 'my_work_page.dart';
import 'my_work_page2.dart';
import 'my_work_page3.dart';
import 'work_list_page4.dart';
import 'my_work_page5.dart';
import 'my_work_page6.dart';
import 'my_work_page7.dart';
import 'my_work_page8.dart';
import 'my_work_page9.dart';
import 'my_work_page10.dart';
import 'my_work_page11.dart';
import 'my_work_page12.dart';
import 'my_work_page13.dart';
import 'my_work_page14.dart';
import 'my_work_page15.dart';
import 'my_work_page16.dart';
import 'my_work_page17.dart';
import 'my_work_page18.dart';
import 'my_work_page19.dart';
import 'my_work_page20.dart';
import 'my_work_page21.dart';


class WorkListPage extends StatelessWidget {
  const WorkListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Work')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.assignment, color: Colors.purple),
            title: const Text('Modul 6 - GridView'),
            subtitle: const Text('Tugas dan latihan modul 6'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage6(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 6 - ListView'),
            subtitle: const Text('Tugas dan latihan modul 6'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage7(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 12 - ListView'),
            subtitle: const Text('Tugas dan latihan modul 12'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage21(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 9 - Stateful Widget'),
            subtitle: const Text('Tugas dan latihan modul 9'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage17(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Latihan 9 - Stateful Widget'),
            subtitle: const Text('Project 9'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage18(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Tugas 10 - JSON Serialization'),
            subtitle: const Text('Project 10'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage19(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 11 -  Manajemen State dengan GetX'),
            subtitle: const Text('Tugas 11'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage20(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 7'),
            subtitle: const Text('Tugas dan latihan modul'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage13(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 7 - Tugas'),
            subtitle: const Text('Tugas dan latihan modul'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage14(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 8'),
            subtitle: const Text('Tugas dan latihan modul'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage15(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 8 - Tugas'),
            subtitle: const Text('Tugas dan latihan modul'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage16(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 5 - Widget SizedBox'),
            subtitle: const Text('Tugas dan latihan modul 6'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage11(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Tugas Modul 5 - Pemutar Musik'),
            subtitle: const Text('Tugas dan latihan modul 6'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage12(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 6 - List View Builder'),
            subtitle: const Text('Tugas dan latihan modul 6'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage9(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 6 - Tugas'),
            subtitle: const Text('Tugas dan latihan modul 6'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage10(),
                ),
              );
            },
          ),ListTile(
            leading: const Icon(Icons.assignment, color: Colors.brown),
            title: const Text('Modul 6 - Grid View Builder'),
            subtitle: const Text('Tugas dan latihan modul 6'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage8(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.assignment, color: Colors.deepOrange),
            title: const Text('Tugas Modul 4'),
            subtitle: const Text('Halaman tugas khusus Modul 4'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyWorkPage5(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.book, color: Colors.orange),
            title: const Text('Modul 4'),
            subtitle: const Text('Tugas dan latihan modul 4'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WorkListPage4(),
                ),
              );
            },
          ),
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
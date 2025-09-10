import 'package:flutter/material.dart';
import '../widgets/profile_card.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../widgets/gradient_background.dart';
import '../widgets/chat_message.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _userName = "Muhamad Naldo Zulkarnaen";
  String? _profileImagePath;
  Future<void> _pickProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImagePath = pickedFile.path;
      });
    }
  }

  void _updateUserName(String newName) {
    setState(() {
      _userName = newName;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      ProfileCard(
        name: _userName,
        subtitle: "Belajar Flutter Dasar",
        avatarImage: _profileImagePath != null
            ? FileImage(File(_profileImagePath!))
            : NetworkImage('https://ui-avatars.com/api/?name=Muhamad+Naldo+Zulkarnaen') as ImageProvider,
        onEdit: () {
          setState(() {
            _selectedIndex = 2; // Pindah ke tab Pengaturan
          });
        },
        onChangePhoto: _pickProfileImage,
      ),
      // Contoh halaman chat
      Column(
        children: [
          ChatMessage(
            sender: "Naldo",
            message: "Halo, ini pesan pertama!",
            time: "10:00",
            isMe: true,
          ),
          ChatMessage(
            sender: "Dosen",
            message: "Selamat pagi, Naldo!",
            time: "10:01",
            isMe: false,
          ),
        ],
      ),
      SettingsPage(userName: _userName, onNameChanged: _updateUserName),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Praktikum Flutter"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
            tooltip: 'Notifikasi',
          ),
        ],
      ),
      body: GradientBackground(
        child: Center(child: _pages[_selectedIndex]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),
    );
  }
}

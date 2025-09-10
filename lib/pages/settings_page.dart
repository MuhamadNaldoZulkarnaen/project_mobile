import 'package:flutter/material.dart';
import 'personalization_account_page.dart';

class SettingsPage extends StatefulWidget {
  final String userName;
  final ValueChanged<String> onNameChanged;
  const SettingsPage({super.key, required this.userName, required this.onNameChanged});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late String _currentName;

  @override
  void initState() {
    super.initState();
    _currentName = widget.userName;
  }

  Future<void> _openPersonalization() async {
    final newName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalizationAccountPage(initialName: _currentName),
      ),
    );
    if (newName != null && newName is String && newName != _currentName) {
      setState(() {
        _currentName = newName;
      });
      widget.onNameChanged(newName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Section: Personalisasi Akun
        Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            leading: const Icon(Icons.person, color: Colors.deepPurple),
            title: const Text('Personalisasi Akun', style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Ubah nama & password\nNama saat ini: $_currentName'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            onTap: _openPersonalization,
          ),
        ),

        // Section: Pengaturan Aplikasi
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text('Pengaturan Aplikasi', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
        ),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.indigo),
                title: const Text('Notifikasi'),
                subtitle: const Text('Pengaturan notifikasi aplikasi'),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                leading: const Icon(Icons.lock, color: Colors.teal),
                title: const Text('Privasi & Keamanan'),
                subtitle: const Text('Pengaturan privasi dan keamanan'),
                onTap: () {},
              ),
              const Divider(height: 0),
              ListTile(
                leading: const Icon(Icons.language, color: Colors.orange),
                title: const Text('Bahasa'),
                subtitle: const Text('Pilih bahasa aplikasi'),
                onTap: () {},
              ),
            ],
          ),
        ),

        // Section: Tentang
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Text('Tentang', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
        ),
        Card(
          child: ListTile(
            leading: const Icon(Icons.info, color: Colors.grey),
            title: const Text('Tentang Aplikasi'),
            subtitle: const Text('Versi, developer, dll'),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

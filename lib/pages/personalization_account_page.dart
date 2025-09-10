import 'package:flutter/material.dart';

class PersonalizationAccountPage extends StatefulWidget {
  final String initialName;
  const PersonalizationAccountPage({super.key, required this.initialName});

  @override
  State<PersonalizationAccountPage> createState() => _PersonalizationAccountPageState();
}

class _PersonalizationAccountPageState extends State<PersonalizationAccountPage> {
  late TextEditingController _nameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _saveProfile() {
    // Kirim nama baru ke halaman sebelumnya
    Navigator.pop(context, _nameController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profil berhasil diperbarui!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personalisasi Akun')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ubah Nama', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Nama baru'),
            ),
            const SizedBox(height: 20),
            const Text('Ganti Password', style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: 'Password baru'),
              obscureText: true,
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _saveProfile,
                child: const Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyWorkPage11 extends StatefulWidget {
  const MyWorkPage11({super.key});

  @override
  State<MyWorkPage11> createState() => _MyWorkPage11State();
}

class _MyWorkPage11State extends State<MyWorkPage11> {
  String percobaan = 'Percobaan 1: SizedBox';

  // Method kotak warna
  Container kotakUji(Color warna) {
    return Container(
      height: 75,
      width: 75,
      color: warna,
    );
  }

  Widget percobaan1() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kotakUji(Colors.amber),
          const SizedBox(width: 25, height: 25),
          SizedBox(
            width: 100,
            height: 100,
            child: kotakUji(Colors.green),
          ),
          const SizedBox(width: 25, height: 25),
          kotakUji(Colors.blue),
        ],
      ),
    );
  }

  Widget percobaan2() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          kotakUji(Colors.amber),
          const Spacer(flex: 1),
          SizedBox(
            width: 100,
            height: 100,
            child: kotakUji(Colors.green),
          ),
          const Spacer(flex: 2),
          kotakUji(Colors.blue),
        ],
      ),
    );
  }

  Widget percobaan3() {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(
                Icons.location_pin,
                color: Colors.red,
              ),
              title: Text(
                'Taman Nasional Bromo Tengger Semeru',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Jawa Timur, Indonesia'),
            ),
            Container(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('LIHAT'),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('BAGIKAN'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;
    if (percobaan == 'Percobaan 1: SizedBox') {
      bodyWidget = percobaan1();
    } else if (percobaan == 'Percobaan 2: Spacer') {
      bodyWidget = percobaan2();
    } else {
      bodyWidget = percobaan3();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percobaan Flutter Layout'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: DropdownButton<String>(
              value: percobaan,
              items: const [
                DropdownMenuItem(
                  value: 'Percobaan 1: SizedBox',
                  child: Text('Percobaan 1: SizedBox'),
                ),
                DropdownMenuItem(
                  value: 'Percobaan 2: Spacer',
                  child: Text('Percobaan 2: Spacer'),
                ),
                DropdownMenuItem(
                  value: 'Percobaan 3: Card',
                  child: Text('Percobaan 3: Card'),
                ),
              ],
              onChanged: (val) {
                setState(() {
                  percobaan = val!;
                });
              },
            ),
          ),
          Expanded(child: bodyWidget),
        ],
      ),
    );
  }
}

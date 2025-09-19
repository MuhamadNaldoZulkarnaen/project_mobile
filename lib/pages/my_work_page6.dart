import 'package:flutter/material.dart';

class MyWorkPage6 extends StatelessWidget {
  const MyWorkPage6({super.key});

  // Method tile untuk membuat tile dengan asset gambar
  ClipRRect tile(Color warnaKotak, String gambar, String judul) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: warnaKotak,
        child: GridTile(
          footer: SizedBox(
            height: 45,
            child: GridTileBar(
              backgroundColor: Colors.black38,
              title: Text(
                judul,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          child: Image.asset(gambar, scale: 4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo GridView'),
        backgroundColor: Colors.amber,
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          tile(Colors.amber, 'assets/images/boy.png', 'Tile 1'),
          tile(Colors.blue, 'assets/images/checklist.png', 'Tile 2'),
          tile(Colors.green, 'assets/images/grades.png', 'Tile 3'),
          tile(Colors.red, 'assets/images/homeschooling.png', 'Tile 4'),
          tile(Colors.purple, 'assets/images/pencil.png', 'Tile 5'),
          tile(Colors.orange, 'assets/images/timetable.png', 'Tile 6'),
        ],
      ),
    );
  }
}

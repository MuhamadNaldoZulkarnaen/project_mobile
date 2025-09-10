import 'package:flutter/material.dart';

class MyWorkPage3 extends StatelessWidget {
  const MyWorkPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alignment')),
      body: Container(
        color: const Color(0xFFFFF1F7),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Malang',
              style: TextStyle(fontSize: 40, color: Colors.black87),
            ),
            const SizedBox(height: 16),
            const Text(
              '25°',
              style: TextStyle(fontSize: 100, color: Colors.black87),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  WeatherColumn(
                    day: 'Minggu',
                    icon: Icons.sunny,
                    temp: '20°C',
                  ),
                  WeatherColumn(
                    day: 'Senin',
                    icon: Icons.cloudy_snowing,
                    temp: '23°C',
                  ),
                  WeatherColumn(
                    day: 'Selasa',
                    icon: Icons.cloud,
                    temp: '22°C',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class WeatherColumn extends StatelessWidget {
  final String day;
  final IconData icon;
  final String temp;

  const WeatherColumn({
    super.key,
    required this.day,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 4),
        Icon(icon, size: 36, color: Colors.black87),
        const SizedBox(height: 4),
        Text(temp, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}

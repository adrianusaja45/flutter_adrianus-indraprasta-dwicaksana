import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Information Page')),
      body: const Center(
        child: Text(
          'Ini adalah Information Page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

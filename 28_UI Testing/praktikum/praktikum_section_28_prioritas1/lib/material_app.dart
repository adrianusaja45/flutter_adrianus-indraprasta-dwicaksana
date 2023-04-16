import 'package:flutter/material.dart';
import 'material_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            primary: const Color(0xFF6200EE),
            secondary: const Color(0xFF03DAC5)),
      ),
      home: const HomePage(),
    );
  }
}

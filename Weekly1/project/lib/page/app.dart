import 'package:flutter/material.dart';
import 'package:project_weekly_1/page/page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            primary: Colors.white,
            secondary: const Color.fromARGB(255, 4, 64, 175),
          ),
        ),
        home: const AppPage());
  }
}

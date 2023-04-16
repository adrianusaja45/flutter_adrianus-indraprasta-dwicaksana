import 'package:flutter/material.dart';
import '../view_model/contact_provider.dart';
import 'package:provider/provider.dart';

import 'view/home.dart';
import 'view_model/post_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ContactProvider()),
        ChangeNotifierProvider(create: (context) => PostProvider())
      ],
      child: const MaterialApp(home: Home()),
    );
  }
}

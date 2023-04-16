import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/add_food.dart';
import 'view/home.dart';
import 'view_model/food_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FoodProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Home(),
        routes: {
          '/addFood': (context) => const AddFoodPage(),
        },
      ),
    );
  }
}

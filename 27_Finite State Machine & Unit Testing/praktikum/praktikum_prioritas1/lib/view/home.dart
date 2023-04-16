import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../view_model/food_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
        () => Provider.of<FoodProvider>(context, listen: false).fetchFoods());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food App'),
      ),
      body: Consumer<FoodProvider>(
        builder: (context, foodProvider, _) {
          if (foodProvider.state == RequestState.loading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (foodProvider.state == RequestState.loaded) {
            return ListView.builder(
                itemCount: foodProvider.foods.length,
                itemBuilder: (context, index) {
                  final food = foodProvider.foods[index];
                  return ListTile(
                    title: Text(food.name),
                  );
                });
          } else if (foodProvider.state == RequestState.error) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: Text('No Data'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pushNamed(context, '/addFood');
          },
          label: const Text('Add Food')),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:praktikum_statemachine_dan_testing/model/food_model.dart';
import 'package:praktikum_statemachine_dan_testing/view_model/food_provider.dart';
import 'package:provider/provider.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final _foodController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _foodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Food'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
          TextField(
            controller: _foodController,
            decoration: const InputDecoration(
              labelText: 'Food Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                final addFood = FoodModel(name: _foodController.text.trim());

                Provider.of<FoodProvider>(context, listen: false)
                    .addFood(addFood);
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Success'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Food has been added'),
                              Text('Food : ${addFood.name}'),
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                child: const Text('OK'))
                          ],
                        ));
              },
              child: const Text('Add Food'))
        ]),
      ),
    );
  }
}

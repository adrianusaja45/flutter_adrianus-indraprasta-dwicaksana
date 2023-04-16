import 'package:dio/dio.dart';

import '../model/food_model.dart';

class ApiFood {
  static const String baseUrl = "https://my-json-server.typicode.com/";
  static const String path = "hadihammurabi/flutter-webservice/foods";
  Future<List<FoodModel>> getFoods() async {
    final response = await Dio().get('$baseUrl$path');
    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result;
      return list.map((food) => FoodModel.fromJson(food)).toList();
    } else {
      throw Exception('Failed to load foods');
    }
  }

  Future<FoodModel> postFood(FoodModel food) async {
    final response = await Dio().post('$baseUrl$path', data: food.toJson());
    if (response.statusCode == 201) {
      return FoodModel.fromJson(response.data);
    } else {
      throw Exception('Failed to create food');
    }
  }
}

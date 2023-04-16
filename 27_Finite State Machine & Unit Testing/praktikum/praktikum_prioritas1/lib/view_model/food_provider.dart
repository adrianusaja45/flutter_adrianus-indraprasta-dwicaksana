import 'package:flutter/material.dart';
import '../api/food_api.dart';
import '../model/food_model.dart';

enum RequestState { empty, loading, loaded, error }

class FoodProvider extends ChangeNotifier {
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<FoodModel> _foods = [];
  List<FoodModel> get foods => _foods;

  List<FoodModel> _newFoods = [];
  List<FoodModel> get newFoods => _newFoods;

  String _message = '';
  String get message => _message;

  Future<void> fetchFoods() async {
    _state = RequestState.loading;
    notifyListeners();
    try {
      _foods = await ApiFood().getFoods();
      _state = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      _state = RequestState.error;
      _message = e.toString();
      notifyListeners();
    }
  }

  Future<void> addFood(FoodModel food) async {
    notifyListeners();
    try {
      final newFood = await ApiFood().postFood(food);
      _newFoods.add(newFood);

      notifyListeners();
    } catch (e) {
      _message = e.toString();
      notifyListeners();
    }
  }
}

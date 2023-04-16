import 'package:praktikum_statemachine_dan_testing/api/food_api.dart';
import 'package:praktikum_statemachine_dan_testing/model/food_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'food_api_test.mocks.dart';

@GenerateMocks([ApiFood])
void main() {
  ApiFood apiFood = MockApiFood();

  test('get all food must return data', () async {
    when(apiFood.getFoods()).thenAnswer(
      (_) async => <FoodModel>[
        FoodModel(name: 'Nasi Goreng'),
      ],
    );
    var food = await apiFood.getFoods();
    expect(food.isNotEmpty, true);
  });
}

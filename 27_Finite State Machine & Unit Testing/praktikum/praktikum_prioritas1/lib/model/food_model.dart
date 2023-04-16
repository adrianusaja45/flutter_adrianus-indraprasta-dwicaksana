class FoodModel {
  int? id;
  String name;

  FoodModel({this.id, required this.name});

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

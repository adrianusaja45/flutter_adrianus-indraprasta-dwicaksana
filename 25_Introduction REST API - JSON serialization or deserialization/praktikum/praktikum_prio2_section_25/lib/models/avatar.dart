class Avatar {
  String? image;

  Avatar({this.image});
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Charset': 'utf-8',
  };
  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(
      image: json['image'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
    };
  }
}

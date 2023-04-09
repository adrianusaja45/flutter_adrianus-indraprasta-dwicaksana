class Posts {
  String? title;
  String? body;

  Posts({this.body, this.title});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }
}

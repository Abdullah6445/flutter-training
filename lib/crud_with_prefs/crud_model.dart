class TodoModel {
  String name;
  String age;
  String email;

  TodoModel({
    required this.name,
    required this.age,
    required this.email,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        name: json["name"], age: json["age"], email: json["email"]);
  }

  Map<String, dynamic> tojson() {
    return {
      "name": name,
      "age": age,
      "email": email,
    };
  }
}

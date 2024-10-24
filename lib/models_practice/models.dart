class MyMainModel {
  String title;

  List<MYModel> myMainList = [];

  MyMainModel({required this.title, required this.myMainList});
}

class MYModel {
  String name;
  String number;

  MYModel({
    required this.name,
    required this.number,
  });
}

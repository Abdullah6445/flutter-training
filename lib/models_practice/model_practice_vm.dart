import 'package:stacked/stacked.dart';

import 'models.dart';

class ModelPracticeVM extends BaseViewModel {
  List<MyMainModel> dataList = [listOne, listTwo, listThree];
}

MyMainModel listOne = MyMainModel(title: 'small Child', myMainList: [
  MYModel(name: 'maaz', number: '111'),
  MYModel(name: 'maaz', number: '111'),
]);

MyMainModel listTwo = MyMainModel(title: 'mid Child', myMainList: [
  MYModel(name: 'Abdullah', number: '222'),
  MYModel(name: 'Abdullah', number: '222'),
]);

MyMainModel listThree = MyMainModel(title: 'successor', myMainList: [
  MYModel(name: 'Talha', number: '333'),
  MYModel(name: 'Talha', number: '333'),
]);

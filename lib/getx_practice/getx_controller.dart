
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GetXController extends GetxController{

  RxInt counter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadPrefs();
  }

  increment() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter++;
    await prefs.setInt("counter", counter.value);
    update();
  }

  loadPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    counter.value =  prefs.getInt("counter") ?? 0;
}

}



//
// class CounterController extends GetxController {
//   var counter = 0;
//   increment() {
//     counter++;
//     update();
//   }
// }
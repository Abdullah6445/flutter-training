

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetController extends GetxController{

  RxInt count = 0.obs;

  RxList<dynamic> namesList = [].obs;
  int x = 0;
  Rx<TextEditingController> textEditingController = TextEditingController().obs;

  int? editingIndex;


  @override
  void onInit() {
    super.onInit();
    loadNamesList();

  }

  Future<void> saveNamesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonList = jsonEncode(namesList);        // list ko json ki form me le k jata hai
    await prefs.setString('namesList', jsonList);
  }

  // Load the RxList from SharedPreferences
  Future<void> loadNamesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonList = prefs.getString('namesList') ?? "";
    if (jsonList != null) {
      namesList.value = jsonDecode(jsonList);
    }
  }

  void add(String data){
    x++;
    namesList.add(data + " " + x.toString());
    saveNamesList();
  }

  void edit(int index) {

      textEditingController.value.text = namesList[index];
      editingIndex = index;
      update();
  }

  // Save the edited name
  void saveEdit() {
    if (editingIndex != null) {

        namesList[editingIndex!] = textEditingController.value.text;
        saveNamesList();

        editingIndex = null;

      textEditingController.value.clear();
    }
  }

  void remove(int index){
    namesList.removeAt(index);
    saveNamesList();
  }
}
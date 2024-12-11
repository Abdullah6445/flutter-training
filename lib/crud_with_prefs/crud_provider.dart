import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'crud_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> taskList = [];

  SharedPreferences? prefs;

  // Initialize SharedPreferences and load existing tasks
  Future<void> initializePrefs() async {
    prefs = await SharedPreferences.getInstance();
    loadTasks();
  }

  // Add a new task and save it to SharedPreferences
  Future<void> addTasks(TodoModel tm) async {
    taskList.add(TodoModel(
        name: tm.name,
        age: tm.age,
        email: tm.email)); // Directly add the TodoModel instance
    await savePrefs();
    notifyListeners();
  }

  // Save the task list to SharedPreferences
  Future<void> savePrefs() async {
    if (prefs != null) {
      String jsonSerialize =
          jsonEncode(taskList.map((e) => e.tojson()).toList());
      await prefs!.setString("key", jsonSerialize);
      debugPrint("========>> <<=========");
      debugPrint("========>> JSON Serialize: $jsonSerialize");
      debugPrint("========>> <<=========");
    }
  }

  // Load the task list from SharedPreferences
  void loadTasks() {
    if (prefs != null) {
      String? jsonList = prefs!.getString("key");

      if (jsonList != null) {
        List<dynamic> decodedList = jsonDecode(jsonList);
        debugPrint("========>> <<=========");
        debugPrint("========>> jsonDecode: $decodedList");
        debugPrint("========>> <<=========");
        taskList = decodedList.map((item) => TodoModel.fromJson(item)).toList();
      }
      notifyListeners(); // Notify listeners after loading tasks
    }
  }
}

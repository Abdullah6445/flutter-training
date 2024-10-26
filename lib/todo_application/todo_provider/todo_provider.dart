import 'package:flutter/material.dart';

import '../todo_db_helper/todo_db_helper.dart';

class TodoProvider extends ChangeNotifier {
  final db = DBHelper();

  List<Map<String, dynamic>> tasksList = [];

  Future<List<Map<String, dynamic>>> fetchData() async {
    tasksList = await db.getTasks();

    notifyListeners();

    return tasksList;
  }
}

import 'package:flutetr_training_application/todo_application/todo_model/todo_model.dart';
import 'package:flutter/material.dart';

import '../todo_db_helper/todo_db_helper.dart';

class TodoProvider extends ChangeNotifier {
  final db = DBHelper();

  todoProvider() {
    fetchTasks();
  }

  List<TodoModel> todoList = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  fetchTasks() async {
    todoList = await db.fetchTaskData();
    notifyListeners();

    return todoList;
  }

  insertTask() async {
    final db = DBHelper();

    await db.insertData(titleController.text, descriptionController.text);

    await fetchTasks();

    // notifyListeners();
  }

  deleteTask(int index) async {
    final db = DBHelper();

    await db.deleteData(todoList[index].taskId);

    await fetchTasks();
  }
}

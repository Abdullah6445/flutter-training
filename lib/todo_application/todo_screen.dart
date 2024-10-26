import 'package:flutter/material.dart';

import 'todo_db_helper/todo_db_helper.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key}) {
    DBHelper().getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Application"),
      ),
      body: Center(child: Text("todo")),
    );
  }
}

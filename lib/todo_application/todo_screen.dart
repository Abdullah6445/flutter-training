import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todo_provider/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Application"),
      ),
      body: Center(
          child: Column(
        children: [
          Text("todo"),
          ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().fetchData();
              },
              child: const Text("child")),
          Consumer<TodoProvider>(
            builder: (context, todoProvider, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: todoProvider.tasksList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(todoProvider.tasksList[index]
                              ['task_description']
                          .toString()),
                    );
                  },
                ),
              );
            },
          )
        ],
      )),
    );
  }
}

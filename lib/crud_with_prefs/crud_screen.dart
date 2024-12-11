import 'package:flutetr_training_application/crud_with_prefs/crud_model.dart';
import 'package:flutetr_training_application/crud_with_prefs/crud_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TodoProvider>().initializePrefs();
    return Scaffold(
      appBar: AppBar(
        title: const Text("todo with prefs"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                context.read<TodoProvider>().addTasks(
                    TodoModel(name: 'name', age: 'age', email: 'email'));
              },
              child: const Text("add")),
          Expanded(child: Consumer<TodoProvider>(
            builder: (context, myConsumer, child) {
              return ListView.builder(
                itemCount: myConsumer.taskList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        child: Text(myConsumer.taskList[index].age)),
                    title: Text(myConsumer.taskList[index].name),
                    subtitle: Text(myConsumer.taskList[index].email),
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}

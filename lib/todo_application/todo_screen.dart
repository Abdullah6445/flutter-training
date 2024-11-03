import 'package:flutetr_training_application/todo_application/todo_provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TodoProvider>().fetchTasks();
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .2,
        ),
        Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            return TextField(
              controller: todoProvider.titleController,
            );
          },
        ),
        Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            return TextField(
              controller: todoProvider.descriptionController,
            );
          },
        ),
        ElevatedButton(
            onPressed: () {
              context.read<TodoProvider>().insertTask();
            },
            child: Text("child")),
        Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: todoProvider.todoList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          context.read<TodoProvider>().deleteTask(index);
                        },
                        icon: Icon(Icons.delete)),
                    title: Text(todoProvider.todoList[index].taskTitle),
                    subtitle:
                        Text(todoProvider.todoList[index].taskDescription),
                  );
                },
              ),
            );
          },
        ),
      ],
    ));
  }
}

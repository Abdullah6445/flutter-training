import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'todo_application/todo_provider/todo_provider.dart';
import 'todo_application/todo_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvider>(
          create: (context) => TodoProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          useMaterial3: false,
        ),
        home: TodoScreen(),
      ),
    );
  }
}

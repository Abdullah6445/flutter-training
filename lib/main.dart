import 'package:flutter/material.dart';

import 'api_by_myself/user_screen_vu.dart';
import 'json_serialization/serialize.dart';
import 'streams/stream_screen.dart';
import 'task_of_fields/task_of_fields _vu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider<TodoProvider>(
    //       create: (context) => TodoProvider(),
    //     )
    //   ],
    // child:
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: false,
      ),
      home: TaskOfFieldsVU(),
      // ),TaskOfFieldsVU
    );
  }
}

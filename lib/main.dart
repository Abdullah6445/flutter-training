import 'package:flutter/material.dart';

import 'api_by_myself/user_screen_vu.dart';
import 'json_serialization/serialize.dart';

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
      home: UserScreenVU(),
      // ),
    );
  }
}

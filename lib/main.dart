import 'package:flutetr_training_application/crud_with_prefs/crud_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'crud_with_prefs/crud_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvider>(
          create: (context) => TodoProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Bitcoin Live Price',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
        home: const TodoScreen(), // Set BitcoinScreen as the home screen
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'streams/stream_provider.dart';
// import 'streams/stream_screen.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider<MyStreamProvider>(
//             create: (_) => MyStreamProvider()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: StreamScreen(),
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';

// // import 'streams/stream_provider.dart';
// // import 'streams/stream_screen.dart';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider<MyStreamProvider>(
// //           create: (context) {
// //             return MyStreamProvider();
// //           },
// //         )
// //       ],
// //       child: MaterialApp(
// //         title: 'Flutter Demo',
// //         debugShowCheckedModeBanner: false,
// //         theme: ThemeData(
// //           primarySwatch: Colors.purple,
// //           useMaterial3: false,
// //         ),
// //         home: StreamScreen(),
// //         // ),
// //       ),
// //     );
// //   }
// // }

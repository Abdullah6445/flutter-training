import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'crud_practice/crud_practice.dart';
import 'crud_practice/crud_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CrudProvider>(
          create: (context) => CrudProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Bitcoin Live Price',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
        home: const CrudPractice(), // Set BitcoinScreen as the home screen
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

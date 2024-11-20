// import 'dart:async';

// import 'package:flutter/material.dart';

// class StreamsPage extends StatefulWidget {
//   const StreamsPage({super.key});

//   @override
//   State<StreamsPage> createState() => _StreamsPageState();
// }

// class _StreamsPageState extends State<StreamsPage> {
//   late String time;

//   @override
//   void initState() {
//     super.initState();

//     Timer.periodic(
//       const Duration(seconds: 1),
//       (timer) {
//         return debugPrint("event hit : ${timer.tick}");
//       },
//     );
//   }

//   cancel(){
//     Timer.s
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("streams"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(time.toString()),
//             ElevatedButton(
//                 onPressed: hitEventMethod, child: const Text("hit event")),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stream_provider.dart';
import 'stream_second_screen.dart';

class StreamScreen extends StatelessWidget {
  const StreamScreen({super.key});

  void _addData(BuildContext context) {
    final provider = context.read<MyStreamProvider>();
    provider.addData(provider.fieldController.text);
  }

  void _clearData(BuildContext context) {
    context.read<MyStreamProvider>().fieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final myStreamProvider = context.read<MyStreamProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen - Stream Notification"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<String>(
            stream: myStreamProvider.dataStream,
            builder: (context, snapshot) {
              final displayText = snapshot.hasData ? snapshot.data! : "No Data";

              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text(displayText),
                    const SizedBox(height: 20),
                    Text(displayText),
                    const SizedBox(height: 20),
                    Text(displayText),
                    TextField(
                      controller: myStreamProvider.fieldController,
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                    ),
                    ElevatedButton(
                      onPressed: () => _addData(context),
                      child: const Text("Hit"),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StreamSecondScreen()),
                      ),
                      child: const Text("Move to Second Screen"),
                    ),
                    ElevatedButton(
                      onPressed: () => _clearData(context),
                      child: const Text("Clear"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
// import 'package:flutetr_training_application/streams/stream_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class StreamScreen extends StatelessWidget {
//   const StreamScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Streams Notification"),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const SizedBox(height: 100),
//               Consumer<MyStreamProvider>(
//                 builder: (context, myStreamProvider, child) {
//                   return StreamBuilder<String>(
//                     stream: myStreamProvider.dataStream,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return Text(snapshot.data ?? "Initial Data");
//                       } else {
//                         return const Text("No Data");
//                       }
//                     },
//                   );
//                 },
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Consumer<MyStreamProvider>(
//                 builder: (context, myStreamProvider, child) {
//                   return StreamBuilder<String>(
//                     stream: myStreamProvider.dataStream,
//                     builder: (context, snapshot) {
//                       if (snapshot.hasData) {
//                         return Text(snapshot.data ?? "Initial Data");
//                       } else {
//                         return const Text("No Data");
//                       }
//                     },
//                   );
//                 },
//               ),
//               TextField(
//                 controller: context.read<MyStreamProvider>().fieldController,
//                 decoration: const InputDecoration(border: OutlineInputBorder()),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   final provider = context.read<MyStreamProvider>();
//                   provider.addData(provider.fieldController.text);
//                 },
//                 child: const Text("Hit"),
//               ),
//               // ElevatedButton(
//               //   onPressed: () {
//               //     Navigator.push(
//               //       context,
//               //       MaterialPageRoute(
//               //           builder: (context) => const StreamSecondScreen()),
//               //     );
//               //   },
//               //   child: const Text("Move to second"),
//               // ),
//               ElevatedButton(
//                 onPressed: () {
//                   context.read<MyStreamProvider>().fieldController.clear();
//                 },
//                 child: const Text("Clear"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

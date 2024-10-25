import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/push_pop_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          return PushPopProvider();
        },
      )
    ],
    child: MaterialApp(
      home: PushPopPractice(),
    ),
  ));
}

class PushPopPractice extends StatelessWidget {
  PushPopPractice({super.key});

  String? data;

  @override
  Widget build(BuildContext context) {
    debugPrint("whole app rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Push Pop practice"),
      ),
      body: Column(
        children: [
          Consumer<PushPopProvider>(
            builder: (context, myType, child) {
              return ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return PushPopPracticeSecond();
                      },
                    )).then(
                      (value) {
                        myType.dataFromScreen2 = value;
                      },
                      // (value) {
                      //   value != null
                      //       ? context.read<PushPopProvider>().number = value
                      //       : null;

                      // },
                    );
                  },
                  child: const Text("push"));
            },
          ),
          Consumer<PushPopProvider>(
            builder: (context, pushProvider, child) {
              return Text(
                  'data from pop is is ${pushProvider.dataFromScreen2}');
            },
          )
        ],
      ),
    );
  }
}

class PushPopPracticeSecond extends StatelessWidget {
  const PushPopPracticeSecond({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("whole app rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("PushPopPractice Second"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'this is new');
              },
              child: Text('pop'))
        ],
      ),
    );
  }
}

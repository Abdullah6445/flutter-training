import 'dart:async';
import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  StreamController<String> streamController = StreamController<String>();

  Timer? timer;
  Timer? timer_two;
  String? timer_two_string;

  @override
  void initState() {
    super.initState();
    // Start a timer that updates the stream every second
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      streamController.add(
          "${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}");
    });

    timer_two = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      timer_two_string =
          "${DateTime.now().hour} : ${DateTime.now().minute} : ${DateTime.now().second}";

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Stream called");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Streams Notification"),
      ),
      body: Column(
        children: [
          Text(timer_two_string ?? "nope"),
          SizedBox(
            height: 100,
          ),
          StreamBuilder<String>(
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Center(child: Text(snapshot.data ?? "Initial Data"));
                } else {
                  return const Text("No Data");
                }
              }),
        ],
      ),
    );
  }
}

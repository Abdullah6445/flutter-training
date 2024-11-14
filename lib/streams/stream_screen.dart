import 'dart:async';

import 'package:flutter/material.dart';

class StreamScreen extends StatefulWidget {
  const StreamScreen({super.key});

  @override
  State<StreamScreen> createState() => _StreamScreenState();
}

class _StreamScreenState extends State<StreamScreen> {
  StreamController<String> streamController = StreamController<String>();
  TextEditingController fieldController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Streams Notification"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              StreamBuilder<String>(
                  stream: streamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(snapshot.data ?? "Initial Data");
                    } else {
                      return const Text("No Data");
                    }
                  }),
              TextField(
                controller: fieldController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: () {
                    streamController.add(fieldController.text);
                  },
                  child: const Text("Hit"))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'stream_provider.dart';

class StreamSecondScreen extends StatelessWidget {
  const StreamSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MyStreamProvider>(
      builder: (context, myStreamProvider, child) {
        return Scaffold(
          body: Center(
            child: StreamBuilder<String>(
                stream: myStreamProvider.dataStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data ?? "Initial Data");
                  } else {
                    return const Text("No Data");
                  }
                }),
          ),
        );
      },
    );
  }
}

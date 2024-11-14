import 'dart:async';
import 'package:flutter/material.dart';

class MyStreamProvider extends ChangeNotifier {
  final StreamController<String> streamController = StreamController<String>();
  final TextEditingController fieldController =
      TextEditingController(text: '1231241');

  late final Stream<String> dataStream =
      streamController.stream.asBroadcastStream();

  void addData(String data) {
    streamController.add(data);
    notifyListeners();
  }
}

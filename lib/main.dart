import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'crud_practice/crud_practice.dart';
import 'crud_practice/crud_provider.dart';
import 'flutter_web_view/flutter_web_view_vu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      title: 'Dark Theme App',
      theme: ThemeData.dark(), // Set dark theme

        home: const FlutterWebViewVU(), // Set BitcoinScreen as the home screen
      );

  }
}

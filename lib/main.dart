import 'package:flutetr_training_application/getx_practice/getx_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'getx_practice/getx_screen_vu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderController>(create: (context) => ProviderController(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Disable debug banner
        title: 'Dark Theme App',
        theme: ThemeData.dark(), // Set dark theme

          home:  GetxScreenVU(), // Set BitcoinScreen as the home screen
        ),
    );

  }
}

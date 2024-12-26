

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProviderController extends ChangeNotifier{

  int counter = 0;

  increment() {
    counter++;
    notifyListeners();
  }


}

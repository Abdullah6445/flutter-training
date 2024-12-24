

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'flutter_web_view_vm.dart';

class FlutterWebViewVU extends StackedView<FlutterWebViewVM>{
  const FlutterWebViewVU({super.key});

  @override
  Widget builder(BuildContext context, FlutterWebViewVM viewModel, Widget? child) {
    return Scaffold( appBar:  AppBar(title:  Text("WebView flutter"),),);
  }

  @override
  FlutterWebViewVM viewModelBuilder(BuildContext context) {
    return FlutterWebViewVM();
  }

}
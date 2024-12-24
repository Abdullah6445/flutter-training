

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'flutter_web_view_vm.dart';

class FlutterWebViewVU extends StackedView<FlutterWebViewVM>{
  const FlutterWebViewVU({super.key});

  @override
  Widget builder(BuildContext context, FlutterWebViewVM viewModel, Widget? child) {
    return Scaffold( appBar:  AppBar(title:  const Text("abdullahiftikhar.site"),),
      body:
          viewModel.isLoading ? const Center(
            child: CircularProgressIndicator(),
          ):
              // viewModel.isInternetOn == false ? const Center(child: Text("Please check your Internet\n and reopen the app again")):
              WebViewWidget(controller: viewModel.controller));
  }

  @override
  FlutterWebViewVM viewModelBuilder(BuildContext context) {
    return FlutterWebViewVM();
  }

}
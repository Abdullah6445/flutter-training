


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'getx_controller.dart';
import 'getx_screen_vm.dart';

class GetxScreenVU extends StackedView<GetxScreenVM>{
   GetxScreenVU({super.key});



  @override
  Widget builder(BuildContext context, GetxScreenVM viewModel, Widget? child) {
    debugPrint("\n********** getx page rebuild **********\n");
    return Scaffold(

      appBar: AppBar(title:  const Text("Getx Screen")),
      body: Center(child: Consumer<ProviderController>(builder: (BuildContext context, ProviderController value, Widget? child) {
        return Text(value.counter.toString());
      },)
    ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        debugPrint("\n********** floating button rebuild **********\n");
        context.read<ProviderController>().increment();



      },child: Icon(Icons.add),),


    );
  }

  @override
  GetxScreenVM viewModelBuilder(BuildContext context) {
    return GetxScreenVM();
  }

}

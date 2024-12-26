


import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: Obx(() {
        debugPrint("\n********** text rebuild **********\n");


        return Center(child: Text(viewModel.counterController.counter.toString()));
      },),
      floatingActionButton: FloatingActionButton(onPressed: () {
        debugPrint("\n********** floating button rebuild **********\n");
        viewModel.counterController.increment();



      },child: Icon(Icons.add),),


    );
  }

  @override
  GetxScreenVM viewModelBuilder(BuildContext context) {
    return GetxScreenVM();
  }

}

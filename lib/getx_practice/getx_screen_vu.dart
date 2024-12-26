import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'getx_screen_vm.dart';

class GetxScreenVU extends StackedView<GetxScreenVM>{
   GetxScreenVU({super.key});

  @override
  Widget builder(BuildContext context, GetxScreenVM viewModel, Widget? child) {
    debugPrint("\n********** getx page rebuild **********\n");
    return Scaffold(

      appBar: AppBar(title:  const Text("Getx Screen")),
      body: Column(
        children: [
          Obx(() {
            debugPrint("\n********** text rebuild **********\n");
            return Text(viewModel. getController.count.toString());
          },),
          Obx(() {
            debugPrint("\n********** textField rebuild **********\n");
            return  TextFormField(controller: viewModel.getController.textEditingController.value,);
          },),

          TextButton(
            onPressed: () {
              viewModel.getController.saveEdit();
            },
             child: Text("Done"),
          ),

          Expanded(
            child: Obx(() {
              debugPrint("\n********** listview rebuild **********\n");

              return ListView.builder(
                itemCount: viewModel.getController.namesList.length,
                itemBuilder: (context, index) {
                  return ListTile(

                    title: Text(viewModel.getController.namesList[index].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(

                        children: [
                        IconButton(onPressed: () {
                          debugPrint("\n********** edit button rebuild **********\n");
                          viewModel.getController.edit(index);

                          }, icon: Icon(Icons.edit,color: Colors.green,) , ),
                          IconButton(onPressed: () {
                            debugPrint("\n********** remove button rebuild **********\n");

                            viewModel.getController.remove(index);

                          }, icon: Icon(Icons.delete,color: Colors.red,) , ),
                        ],
                      ),
                    ),
                     
                  );
                },);
            }
            ),
          )
        ],
      ),



      floatingActionButton: FloatingActionButton(onPressed: () {
        debugPrint("\n********** add button rebuild **********\n");
        viewModel.getController.add("name");

      },child: const Icon(Icons.add),),

    );
  }

  @override
  GetxScreenVM viewModelBuilder(BuildContext context) {
    return GetxScreenVM();
  }

}

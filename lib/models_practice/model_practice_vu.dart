import 'package:flutetr_training_application/models_practice/models.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'model_practice_vm.dart';

class ModelPracticeVU extends StackedView<ModelPracticeVM> {
  const ModelPracticeVU({super.key});

  @override
  Widget builder(
      BuildContext context, ModelPracticeVM viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("this is model training"),
      ),
      body: ListView.builder(
        itemCount: viewModel.dataList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DescriptionPage(
                    newTitle: viewModel.dataList[index].title,
                    myModelList: viewModel.dataList[index].myMainList,
                  );
                },
              ));
            },
            title: Text(viewModel.dataList[index].title),
          );
        },
      ),
    );
  }

  @override
  ModelPracticeVM viewModelBuilder(BuildContext context) {
    return ModelPracticeVM();
  }
}

class DescriptionPage extends StatelessWidget {
  final String newTitle;
  final List<MYModel> myModelList;

  const DescriptionPage(
      {super.key, required this.newTitle, required this.myModelList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newTitle),
      ),
      body: ListView.builder(
        itemCount: myModelList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myModelList[index].name),
            subtitle: Text(myModelList[index].number),
          );
        },
      ),
    );
  }
}

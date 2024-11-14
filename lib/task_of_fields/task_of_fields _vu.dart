import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

import 'task_of_fields _vm.dart';

class TaskOfFieldsVU extends StackedView<TaskOfFieldsVm> {
  @override
  Widget builder(
      BuildContext context, TaskOfFieldsVm viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: viewModel.fieldController,
              decoration: InputDecoration(border: OutlineInputBorder()),

              // controller: viewModel.fieldController,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 3,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        viewModel.fieldController.text = "One";
                        viewModel.notifyListeners();
                      },
                      child: const Text("One")),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.fieldController.text = "two";
                        viewModel.notifyListeners();
                      },
                      child: const Text("Two")),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.fieldController.text = "three";
                        viewModel.notifyListeners();
                      },
                      child: const Text("Three")),
                  ElevatedButton(
                      onPressed: () {
                        viewModel.fieldController.text = "four";
                        viewModel.notifyListeners();
                      },
                      child: const Text("four"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  TaskOfFieldsVm viewModelBuilder(BuildContext context) {
    return TaskOfFieldsVm();
  }
}

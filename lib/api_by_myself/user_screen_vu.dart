import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_screen_vm.dart';

class UserScreenVU extends StackedView<UserScreenVM> {
  const UserScreenVU({super.key});

  @override
  Widget builder(BuildContext context, UserScreenVM viewModel, Widget? child) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("........"),
        ),
        body: Column(
          children: [
            const Row(
              children: [
                Spacer(),
                Text(
                  '1',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
                Spacer(),
                Text(
                  '2',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: viewModel.gettingData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    const Center(child: Text("error...."));
                  }
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: viewModel.userActualList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(viewModel.userActualList[index].name),
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text("please Wait"));
                  }
                },
              ),
            ),
          ],
        ));
  }

  @override
  UserScreenVM viewModelBuilder(BuildContext context) {
    return UserScreenVM();
  }
}

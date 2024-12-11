import 'package:flutter/material.dart';

class CrudPractice extends StatelessWidget {
  const CrudPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("...."),
      ),
      body: Column(
        children: [
          TextFormField(
            // controller: ,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("child")),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("namesdfs"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

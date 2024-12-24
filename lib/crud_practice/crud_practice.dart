// import 'package:flutetr_training_application/crud_practice/crud_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class CrudPractice extends StatelessWidget {
//   const CrudPractice({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("...."),
//       ),
//       body: Column(
//         children: [
//           TextFormField(
//             // controller: ,
//             decoration: InputDecoration(border: OutlineInputBorder()),
//           ),
//           ElevatedButton(onPressed: () {}, child: const Text("child")),
//           Expanded(
//             child: ListView.builder(
//               itemCount: 5,
//               itemBuilder: (context, index) {
//                 return Consumer<CrudProvider>(
//                   builder: (context, myType, child) {
//                     return ListTile(
//                       title: Text(myType.data),
//                     );
//                   },
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

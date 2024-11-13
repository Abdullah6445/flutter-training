import 'dart:convert';

import 'package:flutter/material.dart';

class SerializePage extends StatefulWidget {
  const SerializePage({super.key});

  @override
  State<SerializePage> createState() => _SerializePageState();
}

class _SerializePageState extends State<SerializePage> {
  @override
  void initState() {
    super.initState();
  }

  PersonModelMain pmm = PersonModelMain.fromJson();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("json decerialization"),
      ),
      body: ListView.builder(
        // itemCount: pmm.personListt.length,
        itemCount: pmm.personListt!.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(index.toString()),
            subtitle: Text(pmm.personListt![index].name),
          );
        },
      ),
    );
  }
}

class PersonModelMain {
  String jsonString = '''
  [
    {
      "name": "Ayesha",
      "age": "25",
      "email": "ayesha.khan123@example.com"
    },
    {
      "name": "Omar",
      "age": "30",
      "email": "omar.ali456@example.com"
    },
    {
      "name": "Zainab",
      "age": "28",
      "email": "zainab.farooq789@example.com"
    },
    {
      "name": "Ahmed",
      "age": "27",
      "email": "ahmed.jamil001@example.com"
    },
    {
      "name": "Sara",
      "age": "24",
      "email": "sara.naqvi202@example.com"
    }
  ]
  ''';

  List<PersonModel>? personListt;

  PersonModelMain.fromJson() {
    personListt = [];

    List<dynamic> decodedData = jsonDecode(jsonString);

    personListt = decodedData
        .map(
          (e) => PersonModel.fromJson(e),
        )
        .toList();

    // for (var i = 0; i < decodedData.length; i++) {
    //   PersonModel pm = PersonModel.fromJson(decodedData[i]);
    //   personListt!.add(pm);
    // }
  }
}

class PersonModel {
  String name;
  String age;
  String email;

  PersonModel({required this.name, required this.age, required this.email});

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'],
      age: json['age'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age, 'email': email};
  }
}


















//   List<PersonModelMain>? personList;

//   PersonModelMainnnn() {
//     List<dynamic> jsonData = jsonDecode(jsonString);
//     personList = [];

//     for (var i = 0; i < jsonData.length; i++) {
//       PersonModelMain pm = PersonModelMain.fromJson(jsonData[i]);
//       personList!.add(pm);
//     }
//   }
// }

// class PersonModelMain {
//   String name;
//   String age;
//   String email;

//   PersonModelMain({
//     required this.name,
//     required this.age,
//     required this.email,
//   });

//   factory PersonModelMain.fromJson(Map<String, dynamic> map) {
//     return PersonModelMain(
//       name: map['name'],
//       age: map['age'],
//       email: map['email'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'age': age,
//       'email': email,
//     };
//   }
// }




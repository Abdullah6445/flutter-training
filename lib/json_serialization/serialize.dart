import 'package:flutter/material.dart';

class SerializePage extends StatefulWidget {
  const SerializePage({super.key});

  @override
  State<SerializePage> createState() => _SerializePageState();
}

class _SerializePageState extends State<SerializePage> {
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

  PersonModelMain? pmm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("json decerialization"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(index.toString()),
            subtitle: Text(pmm!.personList![index].name),
          );
        },
      ),
    );
  }
}

class PersonModelMain {
  List<PersonModel>? personList;
  PersonModelMain({required this.personList});

  PersonModelMain.fromJson(List<Map<String, dynamic>> json) {
    personList = [];

    for (var i = 0; i < json.length; i++) {
      PersonModel pm = PersonModel.fromJson(json[i]);

      personList!.add(pm);
    }
  }
}

class PersonModel {
  String name;
  int age;
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
    return {
      'name': name,
      'age': age,
      'email': email,
    };
  }
}

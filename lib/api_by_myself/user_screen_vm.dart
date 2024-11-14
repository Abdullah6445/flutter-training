import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class UserScreenVM extends BaseViewModel {
  List<UserModel> userActualList = [];
  gettingData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    List<dynamic> decodedList = jsonDecode(response.body);

    for (var i = 0; i < decodedList.length; i++) {
      UserModel um = UserModel.fromJson(decodedList[i]);
      userActualList.add(um);
    }

    // for (var i = 0; i < decodedList.length; i++) {
    //   UserModel um = UserModel.fromJson(decodedList[i]);`
    //   userActualList.add(um);
    // }

    // userActualList = decodedList
    //     .map(
    //       (e) => UserModel.fromJson(e),
    //     )
    //     .toList();

    return userActualList;
  }
}

class UserModel {
  int id;
  String name;
  String userName;
  String email;
  String phone;
  String webSite;

  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.phone,
    required this.webSite,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        userName: json['username'],
        phone: json['phone'],
        webSite: json['website'],
        email: json['email']);
  }

  toJson() {
    return {
      'id': id,
      'name': name,
      'username': userName,
      'email': email,
      'phone': phone,
      'website': webSite,
    };
  }
}


// {
//     "id": 1,
//     "name": "Leanne Graham",
//     "username": "Bret",
//     "email": "Sincere@april.biz",
//     "address": {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
//     },
//     "phone": "1-770-736-8031 x56442",
//     "website": "hildegard.org",
//     "company": {
//       "name": "Romaguera-Crona",
//       "catchPhrase": "Multi-layered client-server neural-net",
//       "bs": "harness real-time e-markets"
//     }
//   },
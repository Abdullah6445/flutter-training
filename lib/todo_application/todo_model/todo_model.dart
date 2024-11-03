///
///////
///
///
///
///
///
///
///
///

class TodoModelMain {
  List<TodoModel>? todoModelList;
  TodoModelMain({
    this.todoModelList,
  });
  TodoModelMain.fromJson(List<Map<String, dynamic>> json) {
    todoModelList = [];

    for (var i = 0; i < json.length; i++) {
      TodoModel data = TodoModel.fromJson(json[i]);
      todoModelList!.add(data);
    }
  }
}

class TodoModel {
  int taskId;
  String taskTitle;
  String taskDescription;

  TodoModel({
    required this.taskId,
    required this.taskTitle,
    required this.taskDescription,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      taskId: json['task_id'],
      taskTitle: json['task_title'],
      taskDescription: json['task_description'],
    );
  }
}


































// class TodoModelMain {
//   List<TodoModel>? todoModelList;

//   TodoModelMain(this.todoModelList);

//   TodoModelMain.fromJson(List<Map<String, dynamic>> json) {
//     todoModelList = [];

//     for (var i = 0; i < json.length; i++) {
//       TodoModel todo = TodoModel.fromJson(json[i]);

//       todoModelList!.add(todo);
//     }
//   }
// }

// class TodoModel {
//   int taskId;
//   String taskTitle;
//   String taskDescription;

//   TodoModel(
//       {required this.taskId,
//       required this.taskTitle,
//       required this.taskDescription});

//   factory TodoModel.fromJson(Map<String, dynamic> json) {
//     return TodoModel(
//         taskId: json['task_id'],
//         taskTitle: json['task_title'],
//         taskDescription: json['task_description']);
//   }

//   // Map<String, dynamic> toJson() => {

//   // };
// }








































// // class TodoModel {
// //   int taskId;
// //   String taskTitle;
// //   String taskDescription;

// //   TodoModel(
// //       {required this.taskId,
// //       required this.taskTitle,
// //       required this.taskDescription});

// //   factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
// //       taskId: json['task_id'],
// //       taskTitle: json['task_id'],
// //       taskDescription: json['task_id']);

// //   Map<String, dynamic> toJson() => {};
// // }

// // class TodoModel {
// //   int surahId;
// //   int verseId;
// //   String verseText;
// //   int parahId;
// //   String englishText;
// //   String urduTafseer;
// //   String englishTafseer;
// //   String arabicTafseer;
// //   String urduText;

// //   VerseModel(
// //       {required this.surahId,
// //       required this.verseId,
// //       required this.verseText,
// //       required this.parahId,
// //       required this.englishText,
// //       required this.urduTafseer,
// //       required this.englishTafseer,
// //       required this.arabicTafseer,
// //       required this.urduText});

// //   factory VerseModel.fromJson(Map<String, dynamic> json) => VerseModel(
// //         surahId: json["surah_id"],
// //         verseId: json["verse_id"],
// //         verseText: json["verse_text"],
// //         parahId: json["parah_id"],
// //         englishText: json["english_text"],
// //         urduTafseer: json["urdu_tafseer"],
// //         englishTafseer: json["english_tafseer"],
// //         arabicTafseer: json["arabic_tafseer"],
// //         urduText: json["urdu_text"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "surah_id": surahId,
// //         "verse_id": verseId,
// //         "verse_text": verseText,
// //         "parah_id": parahId,
// //         "english_text": englishText,
// //         "urdu_tafseer": urduTafseer,
// //         "english_tafseer": englishTafseer,
// //         "arabic_tafseer": arabicTafseer,
// //         "urdu_text": urduText
// //       };
// // }


// // // import 'dart:io';

// // // import 'package:flutter/services.dart';
// // // import 'package:sqflite/sqflite.dart';
// // // import 'package:path/path.dart';

// // // class Quran {
// // //   final int id;
// // //   final String englishName;
// // //   final String englishMeaning;
// // //   final String arabicName;
// // //   final int totalVerse;
            
// // //   Quran({
// // //     required this.id,
// // //     required this.englishName,
// // //     required this.englishMeaning,
// // //     required this.arabicName,
// // //     required this.totalVerse,
// // //   });
// // // }

// import 'dart:io';
// import 'dart:typed_data';
// // import 'package:anwaar_ul_furqaan_flutter/app/common/app_state.dart';
// import 'package:anwaar_ul_furqaan_flutter/app/common/app_state.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import '../screens/quran/surah_list/surah_quran_model/surah_quran_model.dart';

import 'dart:io';
import 'dart:typed_data';

import 'package:flutetr_training_application/todo_application/todo_model/todo_model.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._privateConstructor();
  static Database? _database;

  factory DBHelper() {
    return _instance;
  }

  DBHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;

    if (Platform.isWindows || Platform.isLinux) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'crud.db');

    // Copy the database from assets if it doesn't exist
    if (!await databaseExists(path)) {
      print("Database not found, copying from assets...");
      ByteData data = await rootBundle.load('assets/crud.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }

    Database db = await openDatabase(path, version: 2);
    return db;
  }

  // Method to check if database exists
  Future<bool> databaseExists(String path) async {
    return await File(path).exists();
  }

  // List<Map<String, dynamic>> tasks =
  //       await db.rawQuery('SELECT * FROM todo_tbl ORDER BY task_id ASC');

  //
  //
  //
  //
  //
  //
  //
  //

  //
  /////////////////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///

  Future<List<TodoModel>> fetchTaskData() async {
    final db = await database;

    List<TodoModel> list;

    List<Map<String, dynamic>> tasks =
        await db.rawQuery('SELECT * FROM todo_tbl ORDER BY task_id ASC');

    list = TodoModelMain.fromJson(tasks).todoModelList ?? [];

    return list;
  }

  Future<List<TodoModel>> insertData(
      String taskTitle, String taskDescription) async {
    final db = await database;

    List<TodoModel> list;

    List<Map<String, dynamic>> tasks = await db.rawQuery(
      'INSERT INTO todo_tbl (task_title, task_description) VALUES (?, ?)',
      [taskTitle, taskDescription],
    );
    list = TodoModelMain.fromJson(tasks).todoModelList ?? [];

    return list;
  }

  deleteData(int id) async {
    final db = await database;

    await db.rawDelete('DELETE FROM todo_tbl WHERE task_id = ?', [id]);
  }
}




























































// Future<List<TodoModel>> getTodoTasks() async {
//     final db = await database;

//     List<TodoModel> myTodoList = [];
//     myTodoList = TodoModelMain.fromJson(tasks).todoModelList ?? [];

//     return myTodoList;
//   }


































// import 'dart:io';
// import 'dart:typed_data';
// // import 'package:anwaar_ul_furqaan_flutter/app/common/app_state.dart';
// import 'package:anwaar_ul_furqaan_flutter/app/common/app_state.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';
// import '../screens/quran/surah_list/surah_quran_model/surah_quran_model.dart';

// class DBHelper {
//   static final DBHelper _instance = DBHelper._privateConstructor();
//   static Database? _database;

//   factory DBHelper() {
//     return _instance;
//   }

//   DBHelper._privateConstructor();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     if (Platform.isWindows || Platform.isLinux) {
//       sqfliteFfiInit();
//       databaseFactory = databaseFactoryFfi;
//     }
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, 'newQuranVersionLatest.db');

//     // Copy the database from assets if it doesn't exist
//     if (!await databaseExists(path)) {
//       print("Database not found, copying from assets...");
//       ByteData data = await rootBundle.load('assets/newQuranVersionLatest.db');
//       List<int> bytes =
//           data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//       await File(path).writeAsBytes(bytes);
//     }

//     Database db = await openDatabase(path, version: 2);
//     return db;
//   }

//   // Method to check if database exists
//   Future<bool> databaseExists(String path) async {
//     return await File(path).exists();
//   }

//   Future<List<SurahModel>> surah() async {
//     final db = await database;
//     List<SurahModel> allSurah = [];

//     List<Map<String, dynamic>> surahRows = await db.query(
//       'tbl_surah',
//       orderBy: 'surah_id ASC',
//     );

//     allSurah = SurahModelList.fromJson(surahRows).quranList ?? [];
//     return allSurah;
//   }

//   Future<List<VerseModel>> getVerses(int surahId) async {
//     print("Fetching verses for surah ID: $surahId");
//     final db = await database;
//     try {
//       final List<Map<String, dynamic>> verses = await db.query(
//         'tbl_verse',
//         where: 'surah_id = ?',
//         whereArgs: [surahId],
//         orderBy: 'verse_id ASC',
//       );

//       List<VerseModel> allVerses =
//           QuranVerseModelList.fromJson(verses).quranverseList ?? [];
//       return allVerses;
//     } catch (e) {
//       print('Error fetching verses: $e');
//       return [];
//     }
//   }

//   Future<List<VerseModel>> searchVerses(String searchText) async {
//     final db = await database;
//     try {
//       final List<Map<String, dynamic>> verses = await db.query(
//         'tbl_verse',
//         where: 'english_text LIKE ?',
//         whereArgs: ['%$searchText%'],
//       );

//       List<VerseModel> allVerses =
//           QuranVerseModelList.fromJson(verses).quranverseList ?? [];
//       return allVerses;
//     } catch (e) {
//       print('Error in search query: $e');
//       return [];
//     }
//   }

//   Future<String> taruf(int surahId) async {
//     final db = await database;
//     String description = '';

//     const tarufTable = 'tbl_taruf';
//     const surahIdColumn = 'surah_id';
//     const languageIdColumn = 'language_id';
//     const descriptionColumn = 'description';

//     int languageId = AppState.languageIndex;

//     List<Map<String, dynamic>> tarufRows = await db.query(
//       tarufTable,
//       where: '$surahIdColumn = ? AND $languageIdColumn = ?',
//       whereArgs: [surahId, languageId],
//     );

//     if (tarufRows.isNotEmpty) {
//       description = tarufRows.first[descriptionColumn];
//     }

//     return description;
//   }

//   // Future<Map<String, String>> authorWords() async {
//   //   Database db = await database;
//   //   Map<String, String> author = {'title': '', 'description': ''};
//   //   const arziTable = 'tbl_arziMufasir';

//   //   // Column names
//   //   const titleColumn = 'title';
//   //   const descriptionColumn = 'description';
//   //   const languageIdColumn = 'language_id';

//   //   // int languageId = GlobalVariables.selectedLanguageId;

//   //   // Fetching
//   //   // List<Map<String, dynamic>> result = await db.query(
//   //   //   arziTable,
//   //   //   where: '$languageIdColumn = ?',
//   //   //   whereArgs: [languageId],
//   //   // );

//   //   if (result.isNotEmpty) {
//   //     author['title'] = result.first[titleColumn];
//   //     author['description'] = result.first[descriptionColumn];
//   //   }

//   //   return author;
//   // }
// }

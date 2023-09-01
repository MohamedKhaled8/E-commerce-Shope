// import 'package:sqflite/sqflite.dart';
// import 'package:noteapp/core/model/task_model.dart';

// class DBHelper {
//   // ignore: unused_field
//   static Database? _db;
//   // ignore: unused_field
//   static const int _version = 1;
// // ignore: unused_field
//   static const String _tableName = "tasks";

//   static Future<void> initDb() async {
//     if (_db != null) {
//       return;
//     }
//     try {
//       // ignore: no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings, unused_local_variable
//       String _path = await getDatabasesPath() + 'tasks.db';
//       _db =
//           await openDatabase(_path, version: _version, onCreate: (db, version) {
//         return db.execute("CREATE TABLE $_tableName ("
//             "id INTEGER PRIMARY KEY AUTOINCREMENT,"
//             "title TEXT, note TEXT, date TEXT,"
//             "start TEXT, endTime TEXT,"
//             "remind INTEGER, repeat TEXT,"
//             "color INTEGER, "
//             "isCompleted INTEGER"
//             ") ");
//       });
//     } catch (e) {
//       // print(e.toString());
//     }
//   }

//   static Future<int> insert(TaskModel? task) async {
//     return await _db?.insert(_tableName, task!.tojson()) ?? 1;
//   }

//   static Future<List<Map<String, dynamic>>> query() async {
//     return await _db!.rawQuery("SELECT * FROM tasks").then((value) {
//       // print("Tskkkkkkkkkkkkkkkkkkkkkkkkkkkkkk00");
//       // print(value);
//       return value;
//     });
//   }

//   static delete(TaskModel task) async {
//     return await _db!.delete(_tableName, where: "id=?", whereArgs: [task.id]);
//   }

//   static update(int id) async {
//     return await _db!.rawUpdate('''  UPDATE tasks 

//                 SET isCompleted = ?
//                 WHERE ID =?
//     ''', [1, id]);
//   }
// }

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLiteDbProvider {
  static Future<Database> getDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "Inventario.db");

//    await deleteDatabase(path);

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE producto ("
          "id text not null primary key,"
          "nombre text)");
      await db.execute(
          "INSERT INTO producto (id, nombre) VALUES (?, ?)", ["id001", "Café"]);
      await db.execute("INSERT INTO producto (id, nombre) VALUES (?, ?)",
          ["id002", "Whisky"]);
      await db.execute("INSERT INTO producto (id, nombre) VALUES (?, ?)",
          ["id003", "Cerveza"]);
    });
    return database;
  }
}

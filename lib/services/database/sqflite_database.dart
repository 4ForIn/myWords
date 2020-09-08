import 'dart:async';
import 'dart:io';
import 'package:my_words/services/database/db_strings.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class WordsDatabase {
  static final WordsDatabase _instance = WordsDatabase._internal();

  factory WordsDatabase() => _instance;

  static Database _database1;
  Future<Database> get database1 async {
    if (_database1 != null) {
      return _database1;
    }
    return _database1 = await initDB();
  }

  WordsDatabase._internal();

  Future<String> getPath(String dbName) async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, dbName);
    return path;
  }

  Future<Database> initDB() async {
    //use path_provider
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, "main.db");

    final theDb = await openDatabase(path, version: 1, onCreate: _onCreate);

    //print('called fn initDB() ${theDb.query("SELECT count(*)", where: 'type=?', whereArgs: ['table'] )}');
    return theDb;
  }

  Future<void> _createTableWords(Database db) async {
    await db.execute(DbStrings.createWordsTable);
  }

  Future<void> _createTableUser(Database db) async {
    await db.execute(DbStrings.createUserTable);
  }

  Future<void> _onCreate(Database db, int version) async {
    _createTableUser(db);
    _createTableWords(db);

    /*  await db.execute(
        "CREATE TABLE Words(id STRING PRIMARY KEY, category TEXT, date TEXT, isFavorite INTEGER, en TEXT, pl TEXT, tr TEXT)");

    await db.execute(
        "CREATE TABLE User(uid STRING PRIMARY KEY, email TEXT, name TEXT, password TEXT, userImageUrl TEXT)");
 */
    // ignore: avoid_print
    print("Database was created! Is open? - ${db.isOpen}");
  }

  Future closeDb() async {
    final Database dbClient = await database1;
    dbClient.close();
    // ignore: avoid_print
    print('database closed');
  }
}

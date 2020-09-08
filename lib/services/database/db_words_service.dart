import 'package:my_words/models/models.dart';
import 'package:my_words/services/database/db_strings.dart';
import 'package:my_words/services/database/db_user_service.dart';
import 'package:my_words/services/database/sqflite_database.dart';
import 'package:sqflite/sqflite.dart';

abstract class DbWordsService {
  static Future<Database> _dbObject() async {
    final WordsDatabase database = WordsDatabase();
    final Database db = await database.database1;
    //database.initDB();
    return db;
  }

  static Future<dynamic> addWord(WordModel word) async {
    final String userUid = await DbUserService.getUserUid();
    final String tableName = userUid == null
        ? DbStrings.wordsTable
        : '${DbStrings.wordsTable}$userUid';
    // new reference to instance of db:
    final Database dbClient = await _dbObject();

    try {
      //trying to create e table named Words+user.uid
      // reason - each user has his own words list
      await dbClient.execute(
          "${DbStrings.createIfNotExists} $tableName(${DbStrings.wordsTableRows})");
      // toMap() is the same as toJson()
      final int res = await dbClient.insert(tableName, word.toJson());

      return res;
    } catch (e) {
      // int res = await updateWord(word);
      final String errorText = '${e.code} \n ${e.message}';
      // ignore: avoid_print
      print('From addWord: $errorText');
      return e; //res
    }
  }

  static Future<int> deleteWord([String id]) async {
    final Database dbClient = await _dbObject();
    final String userUid = await DbUserService.getUserUid();
    final String tableName = userUid == null
        ? DbStrings.wordsTable
        : '${DbStrings.wordsTable}$userUid';
    if (id != null) {
      final int res = await dbClient
          .delete(tableName, where: "id = ?", whereArgs: <String>[id]);
      // ignore: avoid_print
      print("Word from table: $tableName; deleted - res: $res");
      return res;
    } else {
      // delete all table WordsUserName
      final int res = await dbClient.delete(tableName);
      // ignore: avoid_print
      print("Word from table: $tableName; deleted - res: $res");
      return res;
    }
  }

  static Future<List<WordModel>> getAllWords() async {
    final Database dbClient = await _dbObject();
    final String userUid = await DbUserService.getUserUid();
    final String tableName = userUid == null
        ? DbStrings.wordsTable
        : '${DbStrings.wordsTable}$userUid';
    await dbClient.execute(
        "${DbStrings.createIfNotExists} $tableName(${DbStrings.wordsTableRows})");
    // Query the table for all The Words.
    final List<Map<String, dynamic>> allWordsAsMap =
        await dbClient.query(tableName, orderBy: 'date DESC');

    // Convert the List<Map<String, dynamic> into a List<Word>.
    return List.generate(allWordsAsMap.length, (item) {
      return WordModel(
        date: allWordsAsMap[item]['date'] as String,
        id: allWordsAsMap[item]['id'] as String,
        en: allWordsAsMap[item]['en'] as String,
        pl: allWordsAsMap[item]['pl'] as String,
        tr: allWordsAsMap[item]['tr'] as String,
        category: allWordsAsMap[item]['category'] as String,
        isFavorite: allWordsAsMap[item]['isFavorite'] as int,
      );
    });
  }

  static Future<int> toggleFavoriteWord(WordModel word) async {
    final int isFavorite = word.isFavorite;
    final int value = isFavorite == 0 ? 1 : 0;
    final String wordId = word.id;

    final Database dbClient = await _dbObject();
    final String userUid = await DbUserService.getUserUid();
    final String tableName = userUid == null
        ? DbStrings.wordsTable
        : '${DbStrings.wordsTable}$userUid';
    //await dbClient.execute(
    //   "CREATE TABLE IF NOT EXISTS $id(id STRING PRIMARY KEY, category TEXT, correctCounter INTEGER, clue TEXT, isFavorite TEXT, image TEXT, seenCounter INTEGER, date TEXT, en TEXT, pl TEXT, tr TEXT)");

    // Query
    //final List<Map<String, dynamic>> allWordsAsMap =
    //  await dbClient.query(tableName, orderBy: 'date DESC');

    final int res = await dbClient.rawUpdate(
        "UPDATE $tableName SET isFavorite = ? WHERE id = ?",
        <dynamic>[value, wordId]);

    await dbClient.query(tableName,
        columns: ['isFavorite'], where: "id = ?", whereArgs: <String>[wordId]);

    return res;
  }
}

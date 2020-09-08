import 'package:my_words/services/database/sqflite_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/services/database/db_strings.dart';

class DbUserService {
  static Future<Database> _dbObject() async {
    final WordsDatabase database = WordsDatabase();
    final Database db = await database.database1;
    //database.initDB();
    return db;
  }

  static Future<int> deleteUserData(String id) async {
    final Database dbClient = await _dbObject();
    final int res = await dbClient.delete(DbStrings.userTable,
        where: "${DbStrings.uid} = ?", whereArgs: <String>[id]);
    //print("Deleted user:  $res");
    return res;
  }

  static Future<int> deleteAllUsersData() async {
    final Database dbClient = await _dbObject();
    final int res = await dbClient.delete(DbStrings.userTable);
    //print("Deleted user:  $res");
    return res;
  }

  static Future<User> getUserDataFromDb() async {
    final Database dbClient = await _dbObject();
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> userData = await dbClient.query("User");

    // Convert the List<Map<String, dynamic> into a List<Word>.
    if (userData.isNotEmpty) {
      final List<User> usersList = List.generate(userData.length, (item) {
        return User(
          email: userData[item][DbStrings.email] as String,
          name: userData[item][DbStrings.name] as String,
          uid: userData[item][DbStrings.uid] as String,
          userImageUrl: userData[item][DbStrings.userImageUrl] as String,
        );
      });
      /* print(
          'getUserDataFromDb() uid: ${usersList[0].uid}, photo: ${usersList[0].userImageUrl}'); */
      return usersList[0];
    } else {
      // ignore: avoid_print
      print('no user in DB');
      return null;
    }
  }

  static Future<String> getUserUid() async {
    final Database dbClient = await _dbObject();
    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> userData = await dbClient.query("User");
    if (userData.isNotEmpty) {
      final String userUid = userData[0][DbStrings.uid] as String;
      return userUid;
    } else {
      // ignore: avoid_print
      print('no user in DB');
      return null;
    }
  }

  Future<dynamic> addUserFromFirestore(User user, String imageUrl) async {
    // new reference to instance of db:
    final Database dbClient = await _dbObject();

    if (imageUrl != null && imageUrl != '') {
      user.copyWith(userImageUrl: imageUrl);
    }
    try {
      await dbClient.execute(
          "CREATE TABLE IF NOT EXISTS ${DbStrings.userTable}(${DbStrings.userTableRows})");
      // convert word object to map and pass it to sql db
      // insert fn takes a map!
      final int res = await dbClient.insert(DbStrings.userTable, user.toJson(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      return res;
    } catch (e) {
      // ignore: avoid_print
      print('ERROR from addUserFromFirestore: ${e.message}');
      // int res = await updateWord(word);
      return e; //res
    }
  }
}

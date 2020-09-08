class DbStrings {
  static const String category = 'category';
  static const String date = 'date';
  static const String email = 'email';
  static const String en = 'en';
  static const String id = 'id';
  static const String isFavorite = 'isFavorite';
  static const String name = 'name';
  static const String password = 'password';
  static const String pl = 'pl';
  static const String userImageUrl = 'userImageUrl';
  static const String tr = 'tr';
  static const String uid = 'uid';

  static const String createIfNotExists = 'CREATE TABLE IF NOT EXISTS';
  static const String createUserIfNotExists =
      'CREATE TABLE IF NOT EXISTS User(uid STRING PRIMARY KEY, email TEXT, name TEXT, password TEXT, userImageUrl TEXT)';
  static const String createWordIfNotExists =
      'CREATE TABLE IF NOT EXISTS Words(id STRING PRIMARY KEY, category TEXT, date TEXT, isFavorite INTEGER, en TEXT, pl TEXT, tr TEXT)';
  static const String createWordsTable =
      'CREATE TABLE Words(id STRING PRIMARY KEY, category TEXT, date TEXT, isFavorite INTEGER, en TEXT, pl TEXT, tr TEXT)';
  static const String createUserTable =
      'CREATE TABLE User(uid STRING PRIMARY KEY, email TEXT, name TEXT, password TEXT, userImageUrl TEXT)';

  static const String userTableRows =
      'uid STRING PRIMARY KEY, email TEXT, name TEXT, password TEXT, userImageUrl TEXT';
  static const String wordsTableRows =
      'id STRING PRIMARY KEY, category TEXT, date TEXT, isFavorite INTEGER, en TEXT, pl TEXT, tr TEXT';

  static const String pathEnd = 'main.db';
  static const String userTable = 'User';
  static const String wordsTable = 'Words';
}

import 'package:my_words/models/models.dart';

AppState rootReducer(AppState state, dynamic action) {
  return const AppState(
    currentUser: User(),
    wordsList: [],
    appSettings: AppSettings(),
  );
}

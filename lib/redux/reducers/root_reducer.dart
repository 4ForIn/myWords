import 'package:my_words/models/models.dart';
import 'package:my_words/redux/reducers/settings_reducer/settings_reducer.dart';
import 'package:my_words/redux/reducers/words_reducer/words_reducer.dart';
import 'user_reducer/user_reducer.dart';

AppState rootReducer(AppState state, dynamic action) {
  return AppState(
    currentUser: userReducer(state.currentUser, action),
    wordsList: wordsReducer(state.wordsList, action),
    appSettings: settingsReducer(state.appSettings, action),
  );
}

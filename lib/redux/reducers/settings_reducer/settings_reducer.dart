import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<AppSettings> settingsReducer = combineReducers<AppSettings>([
  TypedReducer<AppSettings, FakeAction>(fakeReducer),
]);

AppSettings fakeReducer(AppSettings appSettings, FakeAction action) {
  return appSettings;
}

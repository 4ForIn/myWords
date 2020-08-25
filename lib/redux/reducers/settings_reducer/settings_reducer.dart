import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<AppSettings> settingsReducer = combineReducers<AppSettings>([
  TypedReducer<AppSettings, FakeAction>(_darkModeOn),
  TypedReducer<AppSettings, Fake2Action>(_darkModeOff),
  TypedReducer<AppSettings, SetLoggedUserAction>(_thereIsLoggedUser),
  TypedReducer<AppSettings, NoLoggedUserAction>(_thereIsNoLoggedUser),
]);

AppSettings _darkModeOn(AppSettings appSettings, FakeAction action) {
  return appSettings.copyWith(isDarkMode: 'true');
}

AppSettings _darkModeOff(AppSettings appSettings, Fake2Action action) {
  return appSettings.copyWith(isDarkMode: 'false');
}

AppSettings _thereIsLoggedUser(
    AppSettings appSettings, SetLoggedUserAction action) {
  return appSettings.copyWith(isLoggedInUser: true);
}

AppSettings _thereIsNoLoggedUser(
    AppSettings appSettings, NoLoggedUserAction action) {
  return appSettings.copyWith(isLoggedInUser: false);
}

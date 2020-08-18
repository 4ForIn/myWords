import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<AppSettings> settingsReducer = combineReducers<AppSettings>([
  TypedReducer<AppSettings, FakeAction>(_fakeReducer),
  TypedReducer<AppSettings, LoginPageSetForgotPassAction>(_setForgotPassState),
  TypedReducer<AppSettings, LoginPageSetLoginAction>(_setLoginState),
  TypedReducer<AppSettings, LoginPageSetSignupAction>(_setSignupState),
]);

AppSettings _fakeReducer(AppSettings appSettings, FakeAction action) {
  return appSettings;
}

AppSettings _setForgotPassState(
    AppSettings appSettings, LoginPageSetForgotPassAction action) {
  return appSettings.copyWith(loginPageState: 'forgot-password');
}

AppSettings _setLoginState(
    AppSettings appSettings, LoginPageSetLoginAction action) {
  return appSettings.copyWith(loginPageState: AppStrings.logInScr);
}

AppSettings _setSignupState(
    AppSettings appSettings, LoginPageSetSignupAction action) {
  return appSettings.copyWith(loginPageState: AppStrings.signUpScr);
}

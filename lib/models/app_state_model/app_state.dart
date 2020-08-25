import 'package:flutter/material.dart';
import 'package:my_words/config/app_strings.dart';
import 'package:my_words/models/models.dart';

@immutable
class AppState {
  final User currentUser;
  final List<WordModel> wordsList;
  final AppSettings appSettings;
  final HomePageState homePageState;
  final LoginPageState loginPageState;

  const AppState(
      {@required this.currentUser,
      @required this.wordsList,
      @required this.appSettings,
      @required this.homePageState,
      @required this.loginPageState});

  AppState.initialState()
      : currentUser = const User(),
        wordsList = [const WordModel()], // dummysWords
        appSettings = const AppSettings(isDarkMode: 'false'),
        homePageState = const HomePageState(
          selectLanguageRadioListGrVal: AppStrings.en,
          selectedTab: AppStrings.wordsTab,
        ),
        loginPageState = const LoginPageState(
          email: '',
          emailLabel: 'Email address',
          name: '',
          password: '',
          passwordLabel: 'Password',
          pageState: AppStrings.logInScr,
          isObscured: true,
        );

  @override
  String toString() {
    return super.toString();
  }
}

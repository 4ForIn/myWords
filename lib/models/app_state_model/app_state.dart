import 'package:flutter/material.dart';
import 'package:my_words/config/app_strings.dart';
import 'package:my_words/models/models.dart';

@immutable
class AppState {
  final User currentUser;
  final List<WordModel> wordsList;
  final AppSettings appSettings;

  const AppState(
      {@required this.currentUser,
      @required this.wordsList,
      @required this.appSettings});

  AppState.initialState()
      : currentUser = const User(),
        wordsList = [const WordModel()], // dummysWords
        appSettings = const AppSettings(
            isDarkMode: 'false',
            selectLanguageRadioListGrVal: AppStrings.en,
            selectedTab: AppStrings.wordsTab);

  @override
  String toString() {
    return super.toString();
  }
}

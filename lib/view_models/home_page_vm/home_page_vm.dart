import 'package:flutter/material.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

class HomePageViewModel {
  final List<WordModel> wordsList;
  final String radioGroupValue;
  final String activeHomeTab;
  final Function getDataFomDb;
  final Function radioGroupValueHandle;
  final Function deleteWordFromDb;
  final Function searchByLanguage;

  HomePageViewModel(
      {@required this.wordsList,
      this.radioGroupValue,
      this.getDataFomDb,
      this.radioGroupValueHandle,
      this.deleteWordFromDb,
      this.searchByLanguage,
      this.activeHomeTab});

  // ignore: prefer_constructors_over_static_methods
  static HomePageViewModel fromStore(Store<AppState> store) {
    return HomePageViewModel(
      wordsList: store.state.wordsList,
      radioGroupValue: store.state.homePageState.selectLanguageRadioListGrVal,
      activeHomeTab: store.state.homePageState.selectedTab,
      getDataFomDb: () => store.dispatch(getWordsFromDb()),
      deleteWordFromDb: () => store.dispatch(FakeAction()),
      radioGroupValueHandle: () => store.dispatch(FakeAction),
      searchByLanguage: () => store.dispatch(FakeAction),
    );
  }
}

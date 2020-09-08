import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<HomePageState> homePageReducer = combineReducers<HomePageState>([
  TypedReducer<HomePageState, FakeIncrementAction>(_fakeReducer),
  TypedReducer<HomePageState, FavoriteToggleAction>(_favoriteToggle),
  TypedReducer<HomePageState, HomeTabsToggleAction>(_homeTabsToggle),
  TypedReducer<HomePageState, RadioBtnOnChangeAction>(_radioOnChange),
  TypedReducer<HomePageState, FakeIncrementAction>(_setExerciseTab),
]);

HomePageState _fakeReducer(
    HomePageState homePageState, FakeIncrementAction action) {
  return homePageState;
}

HomePageState _favoriteToggle(
    HomePageState homePageState, FavoriteToggleAction action) {
  return homePageState;
}

HomePageState _homeTabsToggle(
    HomePageState homePageState, HomeTabsToggleAction action) {
  const String words = AppStrings.wordsTab;
  const String exercise = AppStrings.exerciseTab;
  final String active = homePageState.selectedTab == words ? exercise : words;
  return homePageState.copyWith(selectedTab: active);
}

HomePageState _radioOnChange(
    HomePageState homePageState, RadioBtnOnChangeAction action) {
  return homePageState.copyWith(selectLanguageRadioListGrVal: action.value);
}

HomePageState _setExerciseTab(
    HomePageState homePageState, FakeIncrementAction action) {
  return homePageState;
}

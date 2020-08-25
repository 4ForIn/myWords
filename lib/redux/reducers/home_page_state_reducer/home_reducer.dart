import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<HomePageState> homePageReducer = combineReducers<HomePageState>([
  TypedReducer<HomePageState, FakeIncrementAction>(_fakeReducer),
]);

HomePageState _fakeReducer(
    HomePageState homePageState, FakeIncrementAction action) {
  return homePageState;
}

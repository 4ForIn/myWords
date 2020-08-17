import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<List<WordModel>> wordsReducer = combineReducers<List<WordModel>>([
  TypedReducer<List<WordModel>, FakeAction>(fakeReducer),
]);

List<WordModel> fakeReducer(List<WordModel> wordsList, FakeAction action) {
  return wordsList;
}

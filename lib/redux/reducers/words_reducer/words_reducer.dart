import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<List<WordModel>> wordsReducer = combineReducers<List<WordModel>>([
  TypedReducer<List<WordModel>, FakeIncrementAction>(_fakeReducer),
]);

List<WordModel> _fakeReducer(
    List<WordModel> wordsList, FakeIncrementAction action) {
  final WordModel data = wordsList[0];
  final WordModel data2 = data.copyWith(
      isFavorite: data.isFavorite == null ? 1 : data.isFavorite + 1);
  return [data2].toList();
}

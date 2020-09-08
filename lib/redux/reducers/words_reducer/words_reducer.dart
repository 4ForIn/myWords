import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<List<WordModel>> wordsReducer = combineReducers<List<WordModel>>([
  TypedReducer<List<WordModel>, FavoriteToggleAction>(_favoriteToggle),
  TypedReducer<List<WordModel>, FilterWordsAction>(_filterWords),
  TypedReducer<List<WordModel>, WordsFromDbAction>(_getWordsFromDb),
]);

List<WordModel> _favoriteToggle(
    List<WordModel> wordsList, FavoriteToggleAction action) {
  final WordModel data = wordsList[0];
  final WordModel data2 = data.copyWith(
      isFavorite: data.isFavorite == null ? 1 : data.isFavorite + 1);
  return [data2].toList();
}

List<WordModel> _filterWords(
    List<WordModel> wordsList, FilterWordsAction action) {
  return action.filteredData;
}

List<WordModel> _getWordsFromDb(
    List<WordModel> wordsList, WordsFromDbAction action) {
  return action.words;
}

import 'package:auto_route/auto_route.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/services/database/db_words_service.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AddNewWordAction {}

class WordsFromDbAction {
  final List<WordModel> _words;
  WordsFromDbAction(this._words);
  List<WordModel> get words => _words;
}

class FavoriteToggleAction {
  final WordModel _wordId;
  FavoriteToggleAction(this._wordId);
  WordModel get wordId => _wordId;
}

class FilterWordsAction {
  final List<WordModel> _filtredData;
  FilterWordsAction(this._filtredData);
  List<WordModel> get filteredData => _filtredData;
}

ThunkAction<AppState> addNewWord(WordModel newWord) {
  return (Store<AppState> store) async {
    try {
      await DbWordsService.addWord(newWord)
          .whenComplete(() => ExtendedNavigator.root.pop());
      //store.dispatch(AddNewWordAction());
    } catch (e) {
      // ignore: avoid_print
      print('addNewWord ERROR: ${e.message}');
    }
  };
}

ThunkAction<AppState> deleteWord([String wordId]) {
  return (Store<AppState> store) async {
    try {
      if (wordId != null) {
        await DbWordsService.deleteWord(wordId);
      } else {
        await DbWordsService.deleteWord();
      }
      final List<WordModel> _wordsList = await DbWordsService.getAllWords();
      store.dispatch(WordsFromDbAction(_wordsList));
    } catch (e) {
      // ignore: avoid_print
      print('deleteWord action ERROR: ${e.message}');
    }
  };
}

ThunkAction<AppState> getWordsFromDb() {
  return (Store<AppState> store) async {
    try {
      final List<WordModel> _wordsList = await DbWordsService.getAllWords();
      store.dispatch(WordsFromDbAction(_wordsList));
    } catch (e) {
      // ignore: avoid_print
      print('getWordsFromDb ERROR: ${e.message}');
    }
  };
}

ThunkAction<AppState> searchWordByLanguage(String inputValue) {
  return (Store<AppState> store) async {
    try {
      final List<WordModel> filtredData0 = await DbWordsService.getAllWords();
      List<WordModel> filtredData1;
      final String radioBtn =
          store.state.homePageState.selectLanguageRadioListGrVal;

      if (radioBtn == AppStrings.en) {
        //List<WordModel> allWords = await database.getAllWords(userUid);
        final List<WordModel> filtredData = filtredData0
            .where((element) => element.en
                .toLowerCase()
                .contains(inputValue.toString().toLowerCase()))
            .toList();
        filtredData1 = filtredData == null
            ? []
            : filtredData.whereType<WordModel>().toList();
      } else if (radioBtn == AppStrings.pl) {
        final List<WordModel> filtredData = filtredData0
            .where((element) => element.pl
                .toLowerCase()
                .contains(inputValue.toString().toLowerCase()))
            .toList();
        filtredData1 = filtredData == null
            ? []
            : filtredData.whereType<WordModel>().toList();
      } else if (radioBtn == AppStrings.tr) {
        final List<WordModel> filtredData = filtredData0
            .where((element) => element.tr
                .toLowerCase()
                .contains(inputValue.toString().toLowerCase()))
            .toList();
        filtredData1 = filtredData == null
            ? []
            : filtredData.whereType<WordModel>().toList();
      }

      store.dispatch(FilterWordsAction(filtredData1));
    } catch (e) {
      // ignore: avoid_print
      print('error from searchWordByLanguage(): ${e.message}');
    }
  };
}

ThunkAction<AppState> toggleFavoriteWord(WordModel word) {
  return (Store<AppState> store) async {
    try {
      await DbWordsService.toggleFavoriteWord(word);
      final List<WordModel> _wordsList = await DbWordsService.getAllWords();
      store.dispatch(WordsFromDbAction(_wordsList));
    } catch (e) {
      // ignore: avoid_print
      print('toggleFavoriteWord ERROR: ${e.message}');
    }
  };
}

/* ThunkAction<AppState> resetPassword(String email) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(CheckForLoggedInUserAction());
    } catch (e) {
      // ignore: avoid_print
      print('resetPassword ERROR: ${e.message}');
    }
  };
} */

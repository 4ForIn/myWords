import 'package:my_words/models/models.dart';
import 'package:my_words/services/database/db_words_service.dart';
import 'package:redux/redux.dart';

class AddWordPageViewModel {
  final Function addNewWordToDb;

  AddWordPageViewModel({
    this.addNewWordToDb,
  });

  // ignore: prefer_constructors_over_static_methods
  static AddWordPageViewModel fromStore(Store<AppState> store) {
    return AddWordPageViewModel(
      addNewWordToDb: (WordModel newWord) => addNewWord(newWord),
    );
  }

  static Future<void> addNewWord(WordModel newWord) async {
    try {
      await DbWordsService.addWord(newWord);
      //store.dispatch(AddNewWordAction());
    } catch (e) {
      // ignore: avoid_print
      print('addNewWord ERROR: ${e.message}');
    }
  }
}

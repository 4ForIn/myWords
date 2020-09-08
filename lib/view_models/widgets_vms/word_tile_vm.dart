import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

class WordTileViewModel {
  final Function deleteWordFromDb;
  Function favoriteToggle;
  final String radioGrVal;

  WordTileViewModel({
    this.deleteWordFromDb,
    this.favoriteToggle,
    this.radioGrVal,
  });

  // ignore: prefer_constructors_over_static_methods
  static WordTileViewModel fromStore(Store<AppState> store) {
    return WordTileViewModel(
      //deleteWordFromDb: (id) => store.dispatch(deleteWord(id)),?
      deleteWordFromDb: (String id) => store.dispatch(deleteWord(id)),
      favoriteToggle: (WordModel word) =>
          store.dispatch(toggleFavoriteWord(word)),
      radioGrVal: store.state.homePageState.selectLanguageRadioListGrVal,
    );
  }
}

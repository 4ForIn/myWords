import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/view_models/vms.dart';
import 'package:redux/redux.dart';

class WordTileWidget extends StatelessWidget {
  final BuildContext context;
  final int index;
  final List<WordModel> list;

  WordTileWidget({
    this.context,
    this.index,
    this.list,
    Key key,
  }) : super(key: key);

  final Color _notFavorite = AppTheme.subTitleTextColor;
  final Color _favorite = AppTheme.selectedTabBackgroundColor;

// StoreProvider.of<AppState>(context).dispatch(getFromDb());
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, WordTileViewModel>(
        converter: (Store<AppState> store) =>
            WordTileViewModel.fromStore(store),
        builder: (BuildContext context, WordTileViewModel vm) =>
            languageReducer(vm));
  }

  ListTile languageReducer(WordTileViewModel vm) {
    final String language = vm.radioGrVal;
    final Function pressed = vm.favoriteToggle;
    if (language == AppStrings.en) {
      return ListTile(
        //isThreeLine: true,
        leading: IconButton(
          icon: const Icon(Icons.star_half),
          color: list[index].isFavorite == 0 ? _notFavorite : _favorite,
          onPressed: () => pressed(list[index]),
        ),
        title: Text(
          '${AppStrings.english}:  ${list[index].en}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            '${AppStrings.turkish}:  ${list[index].tr};\npolish:  ${list[index].pl}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete_forever),
          color: AppTheme.topBarBackgroundColor,
          onPressed: () => vm.deleteWordFromDb(list[index].id),
        ),
      );
    } else if (language == AppStrings.pl) {
      return ListTile(
        //isThreeLine: true,
        leading: IconButton(
          icon: const Icon(Icons.star_half),
          color: list[index].isFavorite == 0 ? _notFavorite : _favorite,
          onPressed: () => pressed(list[index]),
        ),
        title: Text(
          '${AppStrings.polish}:  ${list[index].pl}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            '${AppStrings.turkish}:  ${list[index].tr};\nenglish:  ${list[index].en}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete_forever),
          color: AppTheme.topBarBackgroundColor,
          onPressed: () => vm.deleteWordFromDb(list[index].id),
        ),
      );
    } else {
      return ListTile(
        //isThreeLine: true,
        leading: IconButton(
          icon: const Icon(Icons.star_half),
          color: list[index].isFavorite == 0 ? _notFavorite : _favorite,
          onPressed: () => pressed(list[index]),
        ),
        title: Text(
          '${AppStrings.turkish}:  ${list[index].tr}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
            '${AppStrings.english}:  ${list[index].en};\npolish:  ${list[index].pl}'),
        trailing: IconButton(
          icon: const Icon(Icons.delete_forever),
          color: AppTheme.topBarBackgroundColor,
          onPressed: () => vm.deleteWordFromDb(list[index].id),
        ),
      );
    }
  }
}

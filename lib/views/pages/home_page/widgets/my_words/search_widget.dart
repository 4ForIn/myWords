import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _SearchViewModel>(
      converter: (Store<AppState> store) => _SearchViewModel.fromStore(store),
      builder: (BuildContext context, _SearchViewModel vm) => Container(
        height: 4 * SizeConfig.heightMultiplier,
        margin: EdgeInsets.only(
          left: 1 * SizeConfig.heightMultiplier,
          right: SizeConfig.isMobilePortrait
              ? 40 * SizeConfig.widthMultiplier
              : 70 * SizeConfig.widthMultiplier,
        ),
        padding:
            EdgeInsets.symmetric(horizontal: 0.1 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
          border: Border.all(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Icon(Icons.search, size: 3 * SizeConfig.heightMultiplier),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 1 * SizeConfig.heightMultiplier,
                  right: 1 * SizeConfig.heightMultiplier,
                  top: 1 * SizeConfig.heightMultiplier,
                ),
                child: TextField(
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: AppStrings.search,
                  ),
                  style: Theme.of(context).textTheme.headline3,
                  keyboardType: TextInputType.text,
                  onChanged: (String input) => vm.searchByLanguage(input),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchViewModel {
  final Function searchByLanguage;

  _SearchViewModel({
    this.searchByLanguage,
  });

  // ignore: prefer_constructors_over_static_methods
  static _SearchViewModel fromStore(Store<AppState> store) {
    return _SearchViewModel(
      searchByLanguage: (String input) =>
          store.dispatch(searchWordByLanguage(input)),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/views/pages/home_page/widgets/home_page_widgets.dart';
import 'package:my_words/views/widgets/app_widgets.dart';

import 'package:redux/redux.dart';

class MyWordsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //StoreProvider.of<AppState>(context).dispatch(getFromDb());
    return StoreConnector<AppState, _MyWordsTabViewModel>(
      converter: (Store<AppState> store) =>
          _MyWordsTabViewModel.fromStore(store),
      builder: (BuildContext context, _MyWordsTabViewModel vm) => Expanded(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 3 * SizeConfig.heightMultiplier,
            ),
            SearchFieldWidget(
              key: key,
            ),
            RadioBtnGroupWidget(),
            Expanded(
              child: WordsListWidget(
                wordsList: vm.wordsList,
                key: key,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyWordsTabViewModel {
  final List<WordModel> wordsList;

  _MyWordsTabViewModel({
    @required this.wordsList,
  });

  // ignore: prefer_constructors_over_static_methods
  static _MyWordsTabViewModel fromStore(Store<AppState> store) {
    return _MyWordsTabViewModel(
      wordsList: store.state.wordsList,
    );
  }
}

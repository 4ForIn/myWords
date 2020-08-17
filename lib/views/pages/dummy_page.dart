import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _CounterViewModel>(
      converter: (Store<AppState> store) => _CounterViewModel.fromStore(store),
      builder: (BuildContext context, _CounterViewModel vm) => Scaffold(
        appBar: AppBar(
          title: const Text('Dummy page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'how many times',
              ),
              Text(
                '${vm.list[0].isFavorite}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppTheme.selectedTabBackgroundColor,
          onPressed: vm.increment,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class _CounterViewModel {
  final VoidCallback increment;
  final List<WordModel> list;

  _CounterViewModel({this.increment, this.list});

  // ignore: prefer_constructors_over_static_methods
  static _CounterViewModel fromStore(Store<AppState> store) {
    return _CounterViewModel(
      increment: () => store.dispatch(FakeIncrementAction()),
      list: store.state.wordsList,
    );
  }
}

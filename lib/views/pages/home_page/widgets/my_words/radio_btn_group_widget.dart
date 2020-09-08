import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

class RadioBtnGroupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _RadioBtnViewModel>(
      converter: (Store<AppState> store) => _RadioBtnViewModel.fromStore(store),
      builder: (BuildContext context, _RadioBtnViewModel vm) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: RadioListTile<String>(
                activeColor: AppTheme.selectedTabBackgroundColor,
                dense: true,
                title: const Text(
                  AppStrings.en,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                value: AppStrings.en,
                groupValue: vm.radioGrVal,
                onChanged: (value) => vm.radioOnchange(value),
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                activeColor: AppTheme.selectedTabBackgroundColor,
                dense: true,
                title: const Text(
                  AppStrings.pl,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                value: AppStrings.pl,
                groupValue: vm.radioGrVal,
                onChanged: (value) => vm.radioOnchange(value),
              ),
            ),
            Expanded(
              child: RadioListTile<String>(
                activeColor: AppTheme.selectedTabBackgroundColor,
                dense: true,
                title: const Text(
                  AppStrings.tr,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                value: AppStrings.tr,
                groupValue: vm.radioGrVal,
                //vm.radioGroupValue
                onChanged: (value) => vm.radioOnchange(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RadioBtnViewModel {
  final String radioGrVal;
  final Function radioOnchange;
  final Function searchByLanguage;

  _RadioBtnViewModel({
    this.radioGrVal,
    this.radioOnchange,
    this.searchByLanguage,
  });

  // ignore: prefer_constructors_over_static_methods
  static _RadioBtnViewModel fromStore(Store<AppState> store) {
    return _RadioBtnViewModel(
      radioGrVal: store.state.homePageState.selectLanguageRadioListGrVal,
      radioOnchange: (String value) =>
          store.dispatch(RadioBtnOnChangeAction(value)),
      searchByLanguage: () => store.dispatch(FakeAction),
    );
  }
}

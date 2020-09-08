import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _TabsViewModel>(
      converter: (Store<AppState> store) => _TabsViewModel.fromStore(store),
      builder: (BuildContext context, _TabsViewModel vm) => Row(
        children: <Widget>[
          buildTab(
              context: context,
              text: AppStrings.exerciseTab,
              textStyle: Theme.of(context).textTheme.bodyText2,
              vm: vm),
          buildTab(
              context: context,
              text: AppStrings.wordsTab,
              textStyle: Theme.of(context).textTheme.bodyText2,
              vm: vm),
        ],
      ),
    );
  }

  Expanded buildTab(
      {BuildContext context,
      String text,
      TextStyle textStyle,
      _TabsViewModel vm}) {
    return Expanded(
      child: Container(
        padding:
            EdgeInsets.only(top: 0.585 * SizeConfig.heightMultiplier), //?top: 4
        decoration: BoxDecoration(
          color: vm.activeTab == text
              ? AppTheme.selectedTabBackgroundColor
              : AppTheme.unSelectedTabBackgroundColor,
          //this borderRadius makes tabs rounded at the bottom, especially selectedTabBackgroundColor
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(3.0 * SizeConfig.heightMultiplier),
          ),
        ),
        child: Align(
          // the text to be in the middle of the tab height
          alignment: Alignment(0, SizeConfig.isMobilePortrait ? 0.35 : 0.45),
          child: RichText(
            text: TextSpan(
              text: text,
              style: textStyle,
              recognizer: TapGestureRecognizer()..onTap = vm.setActiveTab,
            ),
          ),
        ),
      ),
    );
  }
}

//typedef ViewModelFn1 = Function(String);

class _TabsViewModel {
  final VoidCallback setActiveTab;
  final String activeTab;

  _TabsViewModel({this.setActiveTab, this.activeTab});

  // ignore: prefer_constructors_over_static_methods
  static _TabsViewModel fromStore(Store<AppState> store) {
    return _TabsViewModel(
      setActiveTab: () => store.dispatch(HomeTabsToggleAction()),
      activeTab: store.state.homePageState.selectedTab,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:my_words/view_models/vms.dart';
import 'package:my_words/views/pages/home_page/widgets/home_page_widgets.dart';
import 'package:my_words/views/widgets/app_widgets.dart';

import 'package:redux/redux.dart';

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _scrollController.jumpTo(20);
    }
    if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      // _scrollController.position.extentAfter == 0.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(_scrollListener);
    //StoreProvider.of<AppState>(context).dispatch(getFromDb());
    return StoreConnector<AppState, HomePageViewModel>(
      onInit: (store) => store.dispatch(getWordsFromDb()),
      converter: (Store<AppState> store) => HomePageViewModel.fromStore(store),
      builder: (BuildContext context, HomePageViewModel vm) => Scaffold(
        backgroundColor: AppTheme.mainBackgroundColor,
        body: SafeArea(
          //bottom: false,
          top: false,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildTopBar(),
                Container(
                  padding: EdgeInsets.only(
                    left: 2.3 * SizeConfig.widthMultiplier,
                    right: 2.3 * SizeConfig.widthMultiplier,
                  ),
                  constraints: BoxConstraints(
                      maxHeight: SizeConfig.isPortrait
                          ? 78 * SizeConfig.heightMultiplier
                          : 47 * SizeConfig.heightMultiplier),
                  decoration: const BoxDecoration(
                    color: AppTheme.mainBackgroundColor,
                  ),
                  child: Column(
                    // under the tabs:
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (vm.activeHomeTab == AppStrings.wordsTab)
                        MyWordsTab()
                      else
                        ExerciseTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildTopBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(3.0 * SizeConfig.heightMultiplier),
        ),
      ),
      constraints: BoxConstraints(
          maxHeight: 20 *
              (SizeConfig.isMobilePortrait
                  ? SizeConfig.heightMultiplier
                  : SizeConfig.widthMultiplier)),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: SizeConfig.isMobilePortrait ? 0.4 : 0.35,
            alignment: Alignment.bottomCenter,
            child: Tabs(),
          ),
          ResponsiveWidget(
            key: key,
            portraitLayout: TopContainerPortrait(),
            landscapeLayout: TopContainerLandscape(), // TopContainerLandscape
          ),
        ],
      ),
    );
  }
}

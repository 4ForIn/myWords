import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:my_words/views/widgets/menus/popup_menu_button_widget.dart';
import 'package:my_words/views/widgets/profile_image_widget.dart';
import 'package:redux/redux.dart';

class TopContainerLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) => FractionallySizedBox(
        heightFactor: 0.78,
        //without this alignment it wont start from very top
        alignment: Alignment.topCenter,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(18.0),
            ),
            color: AppTheme.topBarBackgroundColor,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 2.0 * SizeConfig.heightMultiplier,
                          right: 2.0 * SizeConfig.heightMultiplier,
                          top: 2.0 * SizeConfig.heightMultiplier,
                        ),
                        child: Row(
                          children: <Widget>[
                            ProfileImage(),
                            buildHiText(context),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 0.5 * SizeConfig.heightMultiplier,
                          right: 2 * SizeConfig.widthMultiplier,
                          //left: 20 * SizeConfig.widthMultiplier,
                        ),
                        child: buildTopBarText(context),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: PopUpMenuButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTopBarText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          AppStrings.whatLearn,
          style: Theme.of(context).textTheme.headline3,
        ),
      ],
    );
  }

  Expanded buildHiText(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 1 * SizeConfig.heightMultiplier,
        ),
        child: Text(
          AppStrings.homeScreenHi,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

typedef ViewModelFn = Function();

class _ViewModel {
  final ViewModelFn getDataFomDb;

  _ViewModel({
    this.getDataFomDb,
  });

  // ignore: prefer_constructors_over_static_methods
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      getDataFomDb: () => store.dispatch(FakeAction),
    );
  }
}

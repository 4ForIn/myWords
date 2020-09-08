import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:my_words/views/widgets/menus/popup_menu_button_widget.dart';
import 'package:my_words/views/widgets/profile_image_widget.dart';
import 'package:redux/redux.dart';

class TopContainerPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _PortraitTopViewModel>(
      converter: (Store<AppState> store) =>
          _PortraitTopViewModel.fromStore(store),
      builder: (BuildContext context, _PortraitTopViewModel vm) =>
          FractionallySizedBox(
        heightFactor: 0.75,
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.only(top: 2.0 * SizeConfig.heightMultiplier),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(3.5 * SizeConfig.heightMultiplier), // 24
            ),
            color: AppTheme.topBarBackgroundColor,
          ),
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  // ProfilImage padding from left and from up
                  //PopUpMenuButtonWidget padding from right and from up
                  padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
                  width: double.maxFinite, //?
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            ProfileImage(),
                            buildHiText(context),
                            const PopUpMenuButtonWidget(),
                          ],
                        ),
                      ),
                      buildTopBarText(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildTopBarText(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          AppStrings.whatLearn,
          style: Theme.of(context)
              .textTheme
              .headline3
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Expanded buildHiText(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 1 * SizeConfig.heightMultiplier,
        ),
        child: Text(
          AppStrings.hi,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }

  ///------------------------------------------------------------------

}

//typedef ViewModelFn1 = Function();

class _PortraitTopViewModel {
  final Function getDataFomDb;
  final Function logOut;

  _PortraitTopViewModel({
    this.getDataFomDb,
    this.logOut,
  });

  // ignore: prefer_constructors_over_static_methods
  static _PortraitTopViewModel fromStore(Store<AppState> store) {
    return _PortraitTopViewModel(
      getDataFomDb: () => store.dispatch(FakeAction),
      logOut: () => store.dispatch(FakeAction),
    );
  }
}

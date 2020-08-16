import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:my_words/views/widgets/menus/popup_menu_button_widget.dart';
import 'package:my_words/views/widgets/profile_image.dart';
import 'package:my_words/views/widgets/search_field_widget.dart';
import 'package:redux/redux.dart';

class TopContainerPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) => FractionallySizedBox(
        heightFactor: 0.75,
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.only(top: 2.0 * SizeConfig.heightMultiplier),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24.0),
            ),
            color: AppTheme.topBarBackgroundColor,
          ),
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Container(
                  // ProfilImage gets padding from left and from up
                  //Icons.blur_on gets padding from right and from up
                  padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
                  width: double.maxFinite, //?
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            ProfileImage(),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1 * SizeConfig.heightMultiplier,
                                ),
                                child: Text(
                                  AppStrings.homeScreenHi,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ),
                            ),
                            const PopUpMenuButtonWidget(),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            AppStrings.whatLearn,
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
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

  ///------------------------------------------------------------------

  Expanded buildSearchField() {
    return Expanded(
      flex: 7,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 2 * SizeConfig.heightMultiplier),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: const SearchFieldWidget(),
      ),
    );
  }
}

typedef ViewModelFn = Function();

class _ViewModel {
  final ViewModelFn getDataFomDb;
  final ViewModelFn logOut;

  _ViewModel({
    this.getDataFomDb,
    this.logOut,
  });

  // ignore: prefer_constructors_over_static_methods
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      getDataFomDb: () => store.dispatch(FakeAction),
      logOut: () => store.dispatch(FakeAction),
    );
  }
}

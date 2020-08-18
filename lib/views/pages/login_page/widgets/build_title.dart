import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildTitle extends StatelessWidget {
  final String pageState;
  const BuildTitle({
    this.pageState,
    Key key,
  }) : super(key: key);

  String setTitle(String pageState) {
    if ((pageState.contains(AppStrings.logInScr)) ||
        (pageState.contains(AppStrings.resetScr))) {
      return AppStrings.loginCapital.toLowerCase();
    } else if (pageState.contains(AppStrings.signUpScr)) {
      return AppStrings.signUpCapital.toLowerCase();
    } else {
      return AppStrings.loginCapital;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        setTitle(pageState),
        style: TextStyle(fontSize: 6 * SizeConfig.textMultiplier),
      ),
    );
  }
}

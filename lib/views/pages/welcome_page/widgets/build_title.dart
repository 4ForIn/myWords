import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildTitleWidget extends StatelessWidget {
  const BuildTitleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(top: 1.75 * SizeConfig.heightMultiplier),
      //top: 12,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FittedBox(
          child: Text(
            AppStrings.homeScreenReady,
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                fontSize: 3.2 * SizeConfig.heightMultiplier), //fontSize: 22

            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }
}

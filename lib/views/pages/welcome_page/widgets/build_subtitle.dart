import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildSubtitleWidget extends StatelessWidget {
  const BuildSubtitleWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
      alignment: Alignment.topCenter,
      child: FittedBox(
        //surrounding Text() with FittedBox fixing an issue that in landscape orientation
        // the subtitle`s last rows are not visible.
        child: Padding(
          padding: EdgeInsets.only(bottom: 1 * SizeConfig.heightMultiplier),
          child: Text(
            AppStrings.welcomeScreenSubtitle,
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }
}

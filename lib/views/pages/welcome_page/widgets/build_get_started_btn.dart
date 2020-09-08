import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';
//import 'package:my_words/views/pages/pages.dart';

class BuildGetStartedBtnWidget extends StatelessWidget {
  const BuildGetStartedBtnWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //ExtendedNavigator.of(context).push('/login-page');
        ExtendedNavigator.root.push(AppStrings.logInScr);
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // constraints used instead of padding: EdgeInsets.symmetric(vertical: )
          constraints: BoxConstraints(
              minHeight: 5.8 * SizeConfig.heightMultiplier,
              maxHeight: 7.5 * SizeConfig.heightMultiplier), // 7.5 *
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(2.7 * SizeConfig.heightMultiplier),
            ),
            color: AppTheme.topBarBackgroundColor,
          ),
          child: buildBtnText(context),
        ),
      ),
    );
  }

  Row buildBtnText(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Icon(
            Icons.chevron_left,
            size: 8 * SizeConfig.imageSizeMultiplier,
            color: Colors.white,
          ),
        ),
        Text(
          AppStrings.startBtn,
          style: Theme.of(context).textTheme.button,
        ),
        Expanded(
          child: Icon(
            Icons.chevron_right,
            size: 8 * SizeConfig.imageSizeMultiplier,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

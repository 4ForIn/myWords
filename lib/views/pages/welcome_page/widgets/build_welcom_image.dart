import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildWelcomeImageWidget extends StatelessWidget {
  const BuildWelcomeImageWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 1.86 * SizeConfig.heightMultiplier,
        ), // vertical: 12;
        child: Image.asset(
          Images.welcomeImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

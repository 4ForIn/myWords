import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildSignUpTxt extends StatelessWidget {
  final VoidCallback onTapRecognizer;
  const BuildSignUpTxt({
    this.onTapRecognizer,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
        text: TextSpan(
          text: AppStrings.noAccount,
          style: TextStyle(
              fontSize: 1.5 * SizeConfig.textMultiplier,
              color: Colors.grey), // 12
          children: <TextSpan>[
            TextSpan(
              text: ' ${AppStrings.signUpCapital}',
              style: Theme.of(context).textTheme.subtitle2,
              recognizer: TapGestureRecognizer()..onTap = onTapRecognizer,
            ),
          ],
        ),
      ),
    );
  }
}

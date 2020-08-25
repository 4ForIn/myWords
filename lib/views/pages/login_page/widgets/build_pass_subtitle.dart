import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildPassSubtitle extends StatelessWidget {
  final VoidCallback onTapRecognizer;
  final String text;
  //final String email;
  final BuildContext context;
  final GlobalKey<ScaffoldState> scaffoldKey;
  const BuildPassSubtitle({
    this.onTapRecognizer,
    this.text,
    this.context,
    //this.email,
    this.scaffoldKey,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.2 * SizeConfig.heightMultiplier), // 8
      child: Align(
        alignment: Alignment.centerRight,
        child: RichText(
          text: TextSpan(
            text: text,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontSize: 1.7 * SizeConfig.textMultiplier),
            recognizer: TapGestureRecognizer()
              ..onTap = onTapRecognizer, //resetPasswordFn(context),
          ),
        ),
      ),
    );
  }
}

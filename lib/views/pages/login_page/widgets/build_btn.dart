import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const BuildBtn({
    this.onPressed,
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: SizedBox(
        height: 7.31 * SizeConfig.heightMultiplier, // 50
        width: 65.7 * SizeConfig.widthMultiplier, // 270
        child: FlatButton(
          onPressed: onPressed,
          color: AppTheme.topBarBackgroundColor, //color: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(3 * SizeConfig.heightMultiplier),
          ),
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}

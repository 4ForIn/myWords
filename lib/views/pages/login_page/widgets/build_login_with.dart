import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildLoginWith extends StatelessWidget {
  const BuildLoginWith({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      //alignment: Alignment.center,
      child: Text(
        'or login with',
        style: TextStyle(
            fontSize: 2 * SizeConfig.textMultiplier, color: Colors.grey),
      ),
    );
  }
}

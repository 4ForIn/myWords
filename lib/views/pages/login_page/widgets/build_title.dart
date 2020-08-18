import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildTitle extends StatelessWidget {
  const BuildTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Login',
        style: TextStyle(fontSize: 6 * SizeConfig.heightMultiplier),
      ),
    );
  }
}

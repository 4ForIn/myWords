import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class BuildTitleLine extends StatelessWidget {
  const BuildTitleLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // odsunięcie lini od lewej
      padding: EdgeInsets.only(
          top: 0.3 * SizeConfig.heightMultiplier,
          left: 0.8 * SizeConfig.heightMultiplier),
      child: Align(
        alignment: Alignment.centerLeft, // bez tego linia jest na środku szer.
        child: Container(
          width: 9.25 * SizeConfig.widthMultiplier, //38
          height: 0.3 * SizeConfig.heightMultiplier, //2
          color: Colors.black,
        ),
      ),
    );
  }
}

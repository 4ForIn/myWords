import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double
      _screenWidth; //_screenWidth = constraints.maxWidth; or _screenWidth = constraints.maxHeight;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  //check orientation and does it is mobile
  void getOrientation(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

// davide screen into blocks- if 600 -> 6 blocs
// Pixel 3a (1080x2220) 440dpi -> _blockWidth=3.93 | _blockHeight= 7.6

    _blockWidth = _screenWidth / 100; //blockSizeHorizontal
    _blockHeight = _screenHeight / 100; //blockSizeVertical

    textMultiplier = _blockHeight.toDouble();
    imageSizeMultiplier = _blockWidth.toDouble();
    heightMultiplier = _blockHeight.toDouble();
    widthMultiplier = _blockWidth.toDouble();

    // ignore: avoid_print
    print('_blockWidth: $_blockWidth');
    // ignore: avoid_print
    print('blockHeight: $_blockHeight');
    // ignore: avoid_print
    print('constraints.maxHeight: $constraints');
  }
}

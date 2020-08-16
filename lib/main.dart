import 'package:flutter/material.dart';
import 'package:my_words/app/app.dart';
import 'redux/store/store.dart';

void main() {
  final appStore = createReduxStore();
  runApp(MyWordsApp(
    store: appStore,
  ));
}

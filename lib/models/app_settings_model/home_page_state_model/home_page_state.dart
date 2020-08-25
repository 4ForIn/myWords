import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  const factory HomePageState({
    String selectedTab,
    String selectLanguageRadioListGrVal,
    GlobalKey<ScaffoldState> homePageScaffoldKey,
    BuildContext homePageContext,
  }) = _HomePageState;
}

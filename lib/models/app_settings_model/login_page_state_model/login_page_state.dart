import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_page_state.freezed.dart';

@freezed
abstract class LoginPageState with _$LoginPageState {
  //String isDarkMode,

  const factory LoginPageState({
    String email,
    String emailLabel,
    bool isObscured,
    String name,
    String nameLabel,
    String password,
    String passwordLabel,
    String pageState,
    GlobalKey<FormState> loginPageformKey,
    GlobalKey<ScaffoldState> loginPageScaffoldKey,
    BuildContext loginPageContext,
  }) = _LoginPageState;
}

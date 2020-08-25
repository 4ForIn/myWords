import 'package:flutter/material.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';

import 'package:redux/redux.dart';

typedef TextFieldOnChange = String Function(String input);
typedef TextFieldFunctions = Function(String input);

class LoginPageViewModel {
  //final UserModel user;
  String email;
  final TextFieldFunctions emailOnChange;
  final TextFieldFunctions emailOnSave;
  String emailLabel;
  final VoidCallback forgotPassword;
  String name;
  final TextFieldFunctions nameOnSave;
  String loginPageState;
  final bool isObscured;
  String password;
  final TextFieldFunctions passwordOnChange;
  //final TextFieldOnSave passwordOnSave;

  String passwordLabel;

  final Function setForgotPassState;
  final Function setLoginState;
  final VoidCallback setSignupState;
  final VoidCallback toggleIsObscured;

  LoginPageViewModel({
    this.email,
    this.emailOnChange,
    this.emailOnSave,
    this.emailLabel,
    this.forgotPassword,
    this.loginPageState,
    this.isObscured,
    this.name,
    this.nameOnSave,
    this.password,
    this.passwordOnChange,
    this.passwordLabel,
    this.setForgotPassState,
    this.setLoginState,
    this.setSignupState,
    this.toggleIsObscured,
  });

  // ignore: prefer_constructors_over_static_methods
  static LoginPageViewModel fromStore(Store<AppState> store) {
    return LoginPageViewModel(
      /// Email Field:
      email: store.state.loginPageState.email,
      emailLabel: store.state.loginPageState.emailLabel,
      emailOnChange: (emailInput) =>
          store.dispatch(EmailOnChangedAction(emailInput)),
      emailOnSave: (input) => store.dispatch(EmailOnChangedAction(input)),

      ///
      forgotPassword: () => store.dispatch(resetPassword()),
      isObscured: store.state.loginPageState.isObscured,
      loginPageState: store.state.loginPageState.pageState,

      ///Name Field:
      name: store.state.loginPageState.name,
      nameOnSave: (nameInput) => store.dispatch(NameOnSavedAction(nameInput)),

      /// Password Field:
      password: store.state.loginPageState.password,
      passwordLabel: store.state.loginPageState.passwordLabel,
      passwordOnChange: (passwordInput) =>
          store.dispatch(PasswordOnchangedAction(passwordInput)),

      setForgotPassState: () => store.dispatch(SwitchToForgotPassAction()),
      setLoginState: () => store.dispatch(SwitchToLoginAction()),
      setSignupState: () => store.dispatch(SwitchToSignUpAction()),
      toggleIsObscured: () => store.dispatch(ToggleIsObscuredAction()),
    );
  }
}

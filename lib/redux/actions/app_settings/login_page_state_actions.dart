import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/views/widgets/dialogs/custom_dialog_alert.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:my_words/utils/validation_helper.dart';

class EmailOnChangedAction {
  final String _emailInput;
  EmailOnChangedAction(this._emailInput);
  String get emailInput => _emailInput;
}

class EmailOnSavedAction {}

class EmailValidationAction {
  final String _emailInput;
  EmailValidationAction(this._emailInput);
  String get emailInput => _emailInput;
}

class GetLoginPageContextAction {}

class GetLoginPageFormKeyAction {}

class GetLoginPageScaffoldKeyAction {}

class ForgotPasswordAction {}

class NameOnSavedAction {
  final String _nameInput;
  NameOnSavedAction(this._nameInput);
  String get nameInput => _nameInput;
}

class OnInitAction {
  BuildContext context;
  GlobalKey<ScaffoldState> scaffoldKey;

  OnInitAction({this.context, this.scaffoldKey});
}

class PasswordOnSavedAction {
  final String _passwordInput;
  PasswordOnSavedAction(this._passwordInput);
  String get emailInput => _passwordInput;
}

class PasswordOnchangedAction {
  final String _passwordInput;
  PasswordOnchangedAction(this._passwordInput);
  String get passwordInput => _passwordInput;
}

class PasswordSetLabelAction {
  final String _passwordInput;
  PasswordSetLabelAction(this._passwordInput);
  String get passwordInput => _passwordInput;
}

class PasswordValidationAction {
  final String _passwordInput;
  PasswordValidationAction(this._passwordInput);
  String get passwordInput => _passwordInput;
}

class SwitchToSignUpAction {}

class SwitchToLoginAction {}

class SwitchToForgotPassAction {}

class TryToLogInAction {}

class TryToLogInWithGoogleAction {}

class TryToSignUpAction {}

class TryToLogOutAction {}

class ToggleIsObscuredAction {}

ThunkAction<AppState> resetPassword() {
  return (Store<AppState> store) async {
    final String email = store.state.loginPageState.email;
    final BuildContext ctx = store.state.loginPageState.loginPageContext;

    if (!HelpValidate.isEmailValid(email)) {
      store.dispatch(ForgotPasswordAction());
      CustomDialogAlert.buildDialog(
        context: ctx,
        title: 'Error: password not reseted',
        content: 'Please type valid email',
        onPressedFn: () =>
            ExtendedNavigator.of(ctx).pop(), //Navigator.pop(context),
      );
    } else {
      try {
        CustomDialogAlert.buildDialog(
          context: ctx,
          title: 'Reset password',
          content: 'Email was sent to $email',
          onPressedFn: () => ExtendedNavigator.of(ctx).pop(),
        );
        store.dispatch(ForgotPasswordAction());
        /* FirebaseAuth auth = FirebaseAuth.instance;
        await auth.sendPasswordResetEmail(email: email).whenComplete(
              () => CustomDialogAlert.buildDialog(
                context: context,
                title: 'Reset password',
                content: 'Email was sent to $email',
                onPressedFn: () => Navigator.pop(context),
              ),
            ); */
      } catch (e) {
        CustomDialogAlert.buildDialog(
          context: ctx,
          title: 'Error: password not reseted',
          content: '${e.message}',
          onPressedFn: () => ExtendedNavigator.of(ctx).pop(),
        );
        store.dispatch(ForgotPasswordAction());
        // ignore: avoid_print
        print('resetPasswordFn ERROR: $e');
      }
    }
  };
}

/* ThunkAction<AppState> resetPassword(String email) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(ForgotPasswordAction());
    } catch (e) {
      // ignore: avoid_print
      print('resetPassword ERROR: ${e.message}');
    }
  };
} */

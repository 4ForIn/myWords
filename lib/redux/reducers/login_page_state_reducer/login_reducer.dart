import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:my_words/utils/validation_helper.dart';
import 'package:redux/redux.dart';

Reducer<LoginPageState> loginPageReducer = combineReducers<LoginPageState>([
  TypedReducer<LoginPageState, EmailOnChangedAction>(_emailOnChanged),
  //TypedReducer<LoginPageState, EmailOnSavedAction>(_emailOnSave),
  TypedReducer<LoginPageState, EmailValidationAction>(_emailValidation),
  TypedReducer<LoginPageState, ForgotPasswordAction>(_forgotPassword),
  TypedReducer<LoginPageState, NameOnSavedAction>(_nameOnChanged),
  TypedReducer<LoginPageState, OnInitAction>(_onInit),
  TypedReducer<LoginPageState, PasswordOnchangedAction>(_passwordOnChanged),
  //TypedReducer<LoginPageState, PasswordOnSavedAction>(_passwordOnChanged),
  TypedReducer<LoginPageState, PasswordValidationAction>(_passwordValidation),
  TypedReducer<LoginPageState, SwitchToLoginAction>(_setLoginState),
  TypedReducer<LoginPageState, SwitchToForgotPassAction>(_setForgotPassState),
  TypedReducer<LoginPageState, SwitchToSignUpAction>(_setSignupState),
  TypedReducer<LoginPageState, ToggleIsObscuredAction>(_toggleIsObscured),
]);

LoginPageState _emailOnChanged(
    LoginPageState loginPageState, EmailOnChangedAction action) {
  return loginPageState.copyWith(
    email: action.emailInput,
    emailLabel: HelpValidate.emailLabel(action.emailInput),
  );
}

LoginPageState _emailValidation(
    LoginPageState loginPageState, EmailValidationAction action) {
  final String email = action.emailInput;
  String validationText = '';

  if (email.isEmpty || email.length <= 1) {
    validationText = 'Please type Your email';
  } else {
    validationText = null;
  }

  return loginPageState.copyWith(emailLabel: validationText);
}

LoginPageState _forgotPassword(
    LoginPageState loginPageState, ForgotPasswordAction action) {
  // ignore: avoid_print
  print('_forgotPassword from typedReducer');
  return loginPageState;
}

LoginPageState _nameOnChanged(
    LoginPageState loginPageState, NameOnSavedAction action) {
  return loginPageState.copyWith(name: action.nameInput);
}

LoginPageState _onInit(LoginPageState loginPageState, OnInitAction action) {
  return loginPageState.copyWith(
    loginPageScaffoldKey: action.scaffoldKey,
    loginPageContext: action.context,
    // want first open the log in screen, even if before go to sign up (the state is changed)
    pageState: AppStrings.logInScr,
  );
}

LoginPageState _passwordOnChanged(
    LoginPageState loginPageState, PasswordOnchangedAction action) {
  final String pageState = loginPageState.pageState;
  String label;
  if (pageState == AppStrings.signUpScr) {
    label = HelpValidate.passwordLabel(action.passwordInput);
  } else {
    label = 'Password';
  }
  return loginPageState.copyWith(
    password: action.passwordInput,
    passwordLabel: label,
  );
}

LoginPageState _passwordValidation(
    LoginPageState loginPageState, PasswordValidationAction action) {
  final String password = action.passwordInput;
  String validationText = '';

  if (password.isEmpty || password.length < 5) {
    validationText = 'Please type a valid password!';
  } else {
    validationText = null;
  }

  return loginPageState.copyWith(passwordLabel: validationText);
}

LoginPageState _setForgotPassState(
    LoginPageState loginPageState, SwitchToForgotPassAction action) {
  return loginPageState.copyWith(pageState: 'forgot-password');
}

LoginPageState _setLoginState(
    LoginPageState loginPageState, SwitchToLoginAction action) {
  return loginPageState.copyWith(pageState: AppStrings.logInScr);
}

LoginPageState _setSignupState(
    LoginPageState loginPageState, SwitchToSignUpAction action) {
  return loginPageState.copyWith(pageState: AppStrings.signUpScr);
}

LoginPageState _toggleIsObscured(
    LoginPageState loginPageState, ToggleIsObscuredAction action) {
  final bool isObscured = loginPageState.isObscured;
  final bool toggle = !isObscured;
  return loginPageState.copyWith(isObscured: toggle);
}

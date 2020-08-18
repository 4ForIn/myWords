import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:my_words/views/pages/login_page/widgets/login_page_widgets.dart';
import 'package:my_words/views/widgets/dialogs/custom_dialog_alert.dart';
import 'package:redux/redux.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // form key, added to the form
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();

  // ignore: unused_field, prefer_final_fields
  String _email,
      // ignore: unused_field, prefer_final_fields
      _password,
      // ignore: unused_field, prefer_final_fields
      _name,
      _emailValidationInfo = 'Email address',
      _passwordValidationInfo = 'Password'; // variables for use in form
  bool _isObscured = true;

  //Color _eyeButtonColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _LoginPageViewModel>(
      converter: (Store<AppState> store) =>
          _LoginPageViewModel.fromStore(store),
      onDispose: (store) => store.dispatch(LoginPageSetLoginAction()),
      builder: (BuildContext context, _LoginPageViewModel vm) => Scaffold(
        key: _scaffoldKey,
        // backgroundColor: AppTheme.mainBackgroundColor,
        appBar: AppBar(
          //backgroundColor: AppTheme.topBarBackgroundColor,
          title: Text('Log in', style: Theme.of(context).textTheme.headline6),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.fromLTRB(
                5.3 * SizeConfig.widthMultiplier,
                0.0,
                4.3 * SizeConfig.widthMultiplier,
                3.2 * SizeConfig.heightMultiplier), //(22.0, 0.0, 22.0, 22.0)
            children: <Widget>[
              SizedBox(
                  height: 2 * SizeConfig.heightMultiplier), //kToolbarHeight
              BuildTitle(
                pageState: vm.loginPageState,
              ),
              const BuildTitleLine(),
              SizedBox(
                height: 4.3 * SizeConfig.heightMultiplier, //70.0,
              ),
              if (vm.loginPageState == AppStrings.signUpScr)
                buildNameTextField(),
              SizedBox(
                height: 4.3 * SizeConfig.heightMultiplier, //30
              ),
              buildEmailTextField(vm),
              SizedBox(
                height: 4.3 * SizeConfig.heightMultiplier, //30
              ),
              buildPasswordInput(context, vm),
              if (vm.loginPageState == AppStrings.signUpScr)
                BuildPassSubtitle(
                  onTapRecognizer: () {},
                  text: AppStrings.strongPass,
                ),

              if (vm.loginPageState == AppStrings.logInScr)
                BuildPassSubtitle(
                  onTapRecognizer: resetPasswordFn1(),
                  text: AppStrings.forgotPass,
                ),
              SizedBox(
                height: 5.5 * SizeConfig.heightMultiplier, //60
              ),

              BuildBtn(
                onPressed: () {},
                text: vm.loginPageState == AppStrings.signUpScr
                    ? AppStrings.signUpCapital
                    : AppStrings.loginCapital,
              ),
              SizedBox(
                height: 4.3 * SizeConfig.heightMultiplier,
              ),

              if (vm.loginPageState == AppStrings.logInScr)
                const BuildLoginWith(),

              SizedBox(
                height: 2.1 * SizeConfig.heightMultiplier, //16
              ),
              if (vm.loginPageState == AppStrings.logInScr)
                Row(
                  // horizontaly in the middle
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BuilSocialMediaBtn(
                      context: context,
                      icon: MdiIcons.google, // codPoint: 983725
                      iconColor: Colors.blue,
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: 4.5 * SizeConfig.widthMultiplier, //16
                    ),
                  ],
                ),
              SizedBox(height: 7 * SizeConfig.heightMultiplier), // 70
              if (vm.loginPageState == AppStrings.logInScr)
                BuildSignUpTxt(
                  onTapRecognizer: vm.setSignupState,
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Building methods:

  TextFormField buildNameTextField() {
    return TextFormField(
      onSaved: (nameInput) => _name = nameInput,
      validator: (nameInput) => nameValidationHandling(nameInput),
      decoration: const InputDecoration(labelText: 'Name'),
      cursorColor: Colors.black, // label
    );
  }

  TextFormField buildEmailTextField(_LoginPageViewModel vm) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: _emailValidationInfo),
      onChanged: (emailInput) => emailOnChangeHandling(emailInput),
      onSaved: (emailInput) => _email = emailInput,
      // ignore: missing_return
      validator: (emailInput) {
        if (emailInput.isEmpty) {
          return 'Please type an email';
        }
      },
    );
  }

  TextFormField buildPasswordInput(
      BuildContext context, _LoginPageViewModel vm) {
    return TextFormField(
      cursorColor: Colors.black,
      obscureText: _isObscured,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (passwordInput) => _password = passwordInput,
      onChanged: (passwordInput) => passwordOnChangeHandling(passwordInput),
      decoration: InputDecoration(
        labelText: vm.loginPageState == AppStrings.signUpScr
            ? _passwordValidationInfo
            : 'Password',
        // icon at the right sight of password input
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
          icon: Icon(
            Icons.remove_red_eye,
            color: _isObscured ? Colors.grey : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  /// Name field walidation:

  String nameValidationHandling(String nameInput) {
    if (nameInput.isEmpty || nameInput.length <= 1) {
      return 'Please type Your name';
    } else {
      return null;
    }
  }

  /// Email field walidation:

  bool isEmailValid(String email) {
    if (email != null) {
      if (email.length < 5 ||
          !email.contains('@') ||
          !email.contains('.') ||
          email.contains(',')) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  String emailValidationHandling(String emailInput) {
    if (isEmailValid(emailInput)) {
      return 'Please type a valid email address';
    } else {
      return null;
    }
  }

  void emailOnChangeHandling(String emailInput) {
    if (!isEmailValid(emailInput) && emailInput.isNotEmpty) {
      setState(() {
        _emailValidationInfo = 'Email is not valid';
      });
    } else {
      setState(() {
        _emailValidationInfo = 'Email address';
        _email = emailInput;
      });
    }
  }

  /// Password field walidation:

  String passwordValidationHandling(String passwordInput) {
    if (passwordInput.isEmpty || passwordInput.length < 5) {
      return 'Please type a valid password!';
    } else {
      return null;
    }
  }

  void passwordOnChangeHandling(String password) {
    if (password.isEmpty) {
      setState(() {
        _passwordValidationInfo = 'Please enter a password';
      });
    } else if (password.length < 6) {
      setState(() {
        _passwordValidationInfo = 'Password is not strong!';
      });
    } else {
      setState(() {
        _passwordValidationInfo = 'Password';
      });
    }
  }

  /// Handling log in and sign up with Firebase:

// log in with email and password
  void logInHandle(BuildContext context) {}

  // log in with google account:

  // onPressed: () {signInWithGoogle().whenComplete(() {...
  Future<String> signInWithGoogle() async {
    return 'signInWithGoogle succeeded?';
  }

  // log in with facebook:

  void signUpOnTapFn() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => SignUpScreen(), fullscreenDialog: true),
    // );
//    Navigator.push(
//        context,
//        MaterialPageRoute(builder: (BuildContext context) => SignUpScreen()));
  }

  //void notAvailableMethod(BuildContext ctx, IconData icon) {}

  VoidCallback resetPasswordFn1() {
    return () => resetPasswordFn2();
  }

  Future resetPasswordFn2() async {
    if (!isEmailValid(_email)) {
      CustomDialogAlert.buildDialog(
        context: _scaffoldKey.currentContext,
        title: 'Error: password not reseted',
        content: 'Please type valid email',
        onPressedFn: () =>
            ExtendedNavigator.of(context).pop(), //Navigator.pop(context),
      );
    } else {
      try {
        CustomDialogAlert.buildDialog(
          context: context,
          title: 'Reset password',
          content: 'Email was sent to $_email',
          onPressedFn: () => Navigator.pop(context),
        );
        /* FirebaseAuth auth = FirebaseAuth.instance;
        await auth.sendPasswordResetEmail(email: _email).whenComplete(
              () => CustomDialogAlert.buildDialog(
                context: context,
                title: 'Reset password',
                content: 'Email was sent to $_email',
                onPressedFn: () => Navigator.pop(context),
              ),
            ); */
      } catch (e) {
        CustomDialogAlert.buildDialog(
          context: context,
          title: 'Error: password not reseted',
          content: '${e.message}',
          onPressedFn: () => ExtendedNavigator.of(context).pop(),
        );
        // ignore: avoid_print
        print('resetPasswordFn ERROR: $e');
      }
    }
  }
}

class _LoginPageViewModel {
  //final UserModel user;
  String loginPageState;
  final Function setForgotPassState;
  final Function setLoginState;
  final VoidCallback setSignupState;

  _LoginPageViewModel(
      {this.loginPageState,
      this.setForgotPassState,
      this.setLoginState,
      this.setSignupState});

  // ignore: prefer_constructors_over_static_methods
  static _LoginPageViewModel fromStore(Store<AppState> store) {
    return _LoginPageViewModel(
      loginPageState: store.state.appSettings.loginPageState,
      setForgotPassState: () => store.dispatch(LoginPageSetForgotPassAction()),
      setLoginState: () => store.dispatch(LoginPageSetLoginAction()),
      setSignupState: () => store.dispatch(LoginPageSetSignupAction()),
    );
  }
}

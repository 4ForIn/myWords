import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
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

  // ignore: unused_field
  String _email, _password; // variables for use in form
  bool _isObscured = true;

  //Color _eyeButtonColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel vm) => Scaffold(
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
                  height: 3.5 * SizeConfig.heightMultiplier), //kToolbarHeight
              const BuildTitle(),
              const BuildTitleLine(),
              SizedBox(
                height: 5 * SizeConfig.heightMultiplier, //70.0,
              ),
              buildEmailTextField(),
              SizedBox(
                height: 4.3 * SizeConfig.heightMultiplier, //30
              ),
              buildPasswordInput(context),
              buildResetPasswordText(),
              SizedBox(
                height: 5.5 * SizeConfig.heightMultiplier, //60
              ),
              //buildLoginButton(context),
              BuildBtn(
                onPressed: () {},
                text: 'log in',
              ),
              SizedBox(
                height: 4.3 * SizeConfig.heightMultiplier,
              ),
              //buildOrText(),
              const BuildLoginWith(),
              SizedBox(
                height: 2.1 * SizeConfig.heightMultiplier, //16
              ),
              Row(
                // wyśrodkowanie w poziomie
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BuilSocialMediaBtn(
                    context: context,
                    icon: MdiIcons.google,
                    iconColor: Colors.blue,
                    onPressed: () {},
                  ),
                  // codPoint: 983725
                  //GroovinMaterialIcons.google
                  SizedBox(
                    width: 4.5 * SizeConfig.widthMultiplier, //16
                  ),
                ],
              ),
              SizedBox(height: 7 * SizeConfig.heightMultiplier), // 70
              buildSignUpText(),
            ],
          ),
        ),
      ),
    );
  }

  /// Building methods:

  TextFormField buildEmailTextField() {
    return TextFormField(
      onChanged: (emailInput) {
        setState(() {
          _email = emailInput;
          //print('_email: $_email; emailInput: $emailInput.');
        });
      },
      keyboardType: TextInputType.emailAddress,
      onSaved: (emailInput) => _email = emailInput,
      // ignore: missing_return
      validator: (emailInput) {
        if (emailInput.isEmpty) {
          return 'Please type an email';
        }
      },
      decoration: const InputDecoration(labelText: 'Email Address'), // label
    );
  }

  TextFormField buildPasswordInput(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      onSaved: (passwordInput) => _password = passwordInput,
      validator: (passwordInput) {
        if (passwordInput.isNotEmpty) {
          return null;
        } else {
          return 'Please type a password';
        }
      },
      decoration: InputDecoration(
        labelText: 'Password',
        // icon at the right sight of password input
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
          icon: Icon(
            // eye icon
            Icons.remove_red_eye,
            color: _isObscured ? Colors.grey : Theme.of(context).primaryColor,
          ),
        ),
      ),
      obscureText: _isObscured,
    );
  }

  Padding buildResetPasswordText() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: RichText(
          text: TextSpan(
            text: 'Forgot Password?',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontSize: 3 * SizeConfig.widthMultiplier),
            recognizer: TapGestureRecognizer()
              ..onTap = () => resetPasswordFn(context),
          ),
        ),
      ),
    );
  }

  Align buildSignUpText() {
    return Align(
      child: RichText(
        text: TextSpan(
          text: "You Don't have an account?",
          style: const TextStyle(fontSize: 12.0, color: Colors.grey),
          children: <TextSpan>[
            TextSpan(
              text: ' SIGN UP',
              style: Theme.of(context).textTheme.subtitle2,
              recognizer: TapGestureRecognizer()..onTap = signUpOnTapFn,
            ),
            //style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black),),
          ],
        ),
      ),
    );
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

  void notAvailableMethod(BuildContext ctx, IconData icon) {}

  dynamic resetPasswordFn(BuildContext context) async {
    if (_email == null ||
        _email.length < 3 ||
        !_email.contains('@') ||
        !_email.contains('.') ||
        _email.contains(',')) {
      CustomDialogAlert.buildDialog(
        context: context,
        title: 'Error: password not reseted',
        content: 'Please type valid email',
        onPressedFn: () =>
            ExtendedNavigator.of(context).pop(), //Navigator.pop(context),
      );
    } else {
      try {
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

class _ViewModel {
  //final UserModel user;
  final Function loginAndGetUser;

  _ViewModel({
    this.loginAndGetUser,
  });

  // ignore: prefer_constructors_over_static_methods
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loginAndGetUser: () => store.dispatch(FakeAction),
    );
  }
}

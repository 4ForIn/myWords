import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:my_words/utils/validation_helper.dart';
import 'package:my_words/view_models/login_page_vm/login_page_vm.dart';
import 'package:my_words/views/pages/login_page/widgets/login_page_widgets.dart';
import 'package:redux/redux.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginPageViewModel>(
      converter: (Store<AppState> store) => LoginPageViewModel.fromStore(store),
      onInit: (store) => store.dispatch(
        OnInitAction(context: context, scaffoldKey: _scaffoldKey),
      ),
      builder: (BuildContext context, LoginPageViewModel vm) => Scaffold(
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
                  height: 2 * SizeConfig.heightMultiplier), //kToolbarHeight ?
              BuildTitle(
                pageState: vm.loginPageState,
              ),
              const BuildTitleLine(),
              SizedBox(
                height: 4.3 * SizeConfig.heightMultiplier, //70.0,
              ),
              if (vm.loginPageState == AppStrings.signUpScr)
                buildNameTextField(vm),
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
                  onTapRecognizer: vm.forgotPassword,
                  text: AppStrings.forgotPass,
                  context: context,
                  scaffoldKey: _scaffoldKey,
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

  TextFormField buildNameTextField(LoginPageViewModel vm) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: const InputDecoration(labelText: 'Name'),
      onSaved: (nameInput) => vm.nameOnSave(nameInput),
      validator: (nameInput) {
        if (nameInput.isEmpty || nameInput.length < 3) {
          return 'type your name';
        }
        return null;
      },
    );
  }

  TextFormField buildEmailTextField(LoginPageViewModel vm) {
    return TextFormField(
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelStyle: TextStyle(
            color: vm.emailLabel.contains('not valid')
                ? Colors.red
                : AppTheme.subTitleTextColor),
        labelText: vm.emailLabel,
      ),
      onChanged: (emailInput) => vm.emailOnChange(emailInput),
      onSaved: (emailInput) => null,
      // ignore: missing_return
      validator: (emailInput) => HelpValidate.email(emailInput),
    );
  }

  TextFormField buildPasswordInput(
      BuildContext context, LoginPageViewModel vm) {
    return TextFormField(
      cursorColor: Colors.black,
      obscureText: vm.isObscured,
      keyboardType: TextInputType.visiblePassword,
      onSaved: (passwordInput) => null,
      validator: (passwordInput) => HelpValidate.password(passwordInput),
      onChanged: (passwordInput) => vm.passwordOnChange(passwordInput),
      decoration: InputDecoration(
        labelStyle: TextStyle(
            color: vm.passwordLabel.contains('not strong')
                ? Colors.red
                : AppTheme.subTitleTextColor),
        labelText: vm.passwordLabel,
        // icon at the right sight of password input
        suffixIcon: IconButton(
          onPressed: vm.toggleIsObscured,
          icon: Icon(
            Icons.remove_red_eye,
            color: vm.isObscured ? Colors.grey : Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

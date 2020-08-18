import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/views/pages/pages.dart';
import 'package:my_words/views/pages/welcome_page/widgets/welcome_page_widgets.dart';
import 'package:my_words/views/widgets/menus/popup_menu_button_widget.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //WordsDatabase database;
  //FirebaseAuth auth;

  @override
  void initState() {
    super.initState();
    //StoreProvider.of<AppState>(context).dispatch(getFromDb);
    //database = WordsDatabase();
    //database.initDB();
    //auth = FirebaseAuth.instance;
    //checkForLoggedUser();
  }

  /* void checkForLoggedUser() async {
    UserModel userFromDb = await database.getUserDataFromDb();
    if(userFromDb.uid != null) {
      StoreProvider.of<AppState>(context).dispatch(GetCurrentUserAction(userFromDb));
    } else {
      //final FirebaseAuth auth = FirebaseAuth.instance;
      FirebaseUser userFromFireb = await auth.currentUser();
      if(userFromFireb != null) {
        StoreProvider.of<AppState>(context).dispatch(getUserFormFirebase(userFromFireb));
      }
    }
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Column(
          children: <Widget>[
            Expanded(
              // from AppBar to StartBtn
              flex: 4,
              child: Align(
                // alignment: Alignment.center,
                child: Center(
                  child: Column(
                    //mainAxisSize: MainAxisSize.max,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      BuildTitleWidget(),
                      BuildWelcomeImageWidget(),
                      BuildSubtitleWidget(),
                    ],
                  ),
                ),
              ),
            ),
            const BuildGetStartedBtnWidget(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.selectedTabBackgroundColor,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute<WidgetBuilder>(
            //MaterialPageRoute<Null>
            builder: (BuildContext context) {
              return CounterPage();
            },
            fullscreenDialog: true,
          ));
        },
        child: ClipOval(
          child: Image.asset(
            Images.addNewWordIcon,
            fit: BoxFit.contain,
            //scale: 0.1,
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      //backgroundColor: AppTheme.topBarBackgroundColor,
      title: Text(
        'Welcome',
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 3.56 * SizeConfig.widthMultiplier),
          child: const PopUpMenuButtonWidget(),
        ),
      ],
    );
  }
}

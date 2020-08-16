import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';
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
                    children: <Widget>[
                      buildWelcomeTitle(context),
                      //Expanded flex: 1
                      buildWelcomeImage(),
                      //Expanded flex: 3
                      buildWelcomeSubtitle(context),
                      //Expanded flex: 1
                    ],
                  ),
                ), //Image.asset(Images.welcomeImage),
              ),
            ),
            buildStartBtn(context),
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
              return null;

              ///TODO: add_new_word_page
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
      // ignore: prefer_const_literals_to_create_immutables
      actions: <Widget>[
        const PopUpMenuButtonWidget(),
      ],
    );
  }

  Expanded buildWelcomeTitle(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 12),
      //top: 12,(0.5 * SizeConfig.heightMultiplier).toDouble())
      child: Align(
        alignment: Alignment.bottomCenter,
        child: FittedBox(
          child: Text(
            AppStrings.homeScreenReady,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(fontSize: 22), //2.7 *SizeConfig.heightMultiplier

            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }

  Expanded buildWelcomeImage() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12), // vertical: 12;
        child: Image.asset(
          Images.welcomeImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Expanded buildWelcomeSubtitle(BuildContext context) {
    return Expanded(
        child: Align(
      alignment: Alignment.topCenter,
      child: FittedBox(
        //surrounding Text() into FittedBox fixing an issue that in landscape orientation
        // the subtitle`s last rows are not visible.
        child: Padding(
          padding: EdgeInsets.only(bottom: 1 * SizeConfig.heightMultiplier),
          child: Text(
            AppStrings.welcomeScreenSubtitle,
            style: Theme.of(context).textTheme.subtitle2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }

  InkWell buildStartBtn(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push<WidgetBuilder>(
          context,
          MaterialPageRoute(
            builder: (context) => null,
            fullscreenDialog: true,
          ),
        );
        //Navigator.pushNamed(context, '/login');
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // constraints is used instead of a padding padding: EdgeInsets.symmetric(vertical: )
          constraints: BoxConstraints(
              minHeight: 5.8 * SizeConfig.heightMultiplier,
              //5.8 * SizeConfig.heightMultiplier
              maxHeight: 7.5 * SizeConfig.heightMultiplier), // 7.5 *
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(2.7 * SizeConfig.heightMultiplier),
            ),
            color: AppTheme.topBarBackgroundColor,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Icon(
                  Icons.chevron_left,
                  size: 8 * SizeConfig.imageSizeMultiplier,
                  color: Colors.white,
                ),
              ),
              Text(
                AppStrings.startBtn,
                style: Theme.of(context).textTheme.button,
              ),
              Expanded(
                child: Icon(
                  Icons.chevron_right,
                  size: 8 * SizeConfig.imageSizeMultiplier,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

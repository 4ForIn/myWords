import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/app_strings.dart';
import 'package:my_words/config/size_config.dart';
import 'package:my_words/config/styles.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/routes/router.gr.dart';

import 'package:redux/redux.dart';

class MyWordsApp extends StatelessWidget {
  final Store<AppState> store;

  MyWordsApp({this.store});
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: LayoutBuilder(builder: (context, constraints) {
        // constraints gives us screen height and width: constraints.maxHeight
        return OrientationBuilder(builder: (context, orientation) {
          //Orientation.portrait or .landscape
          SizeConfig().getOrientation(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My words',
            theme: AppTheme.lightTheme,
            // lightTheme, darkTheme

            builder: ExtendedNavigator.builder<Router>(
              router: Router(),
              initialRoute: AppStrings.welcomeScr,
              navigatorKey: _navigatorKey,
            ),
          );
        });
      }),
    );
  }
}

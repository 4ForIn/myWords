// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../views/pages/pages.dart';

class Routes {
  static const String addWordPage = '/add-word-page';
  static const String homePage = '/home-page';
  static const String loginPage = '/login-page';
  static const String welcomeScreen = '/';
  static const all = <String>{
    addWordPage,
    homePage,
    loginPage,
    welcomeScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.addWordPage, page: AddWordPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.welcomeScreen, page: WelcomeScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    AddWordPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const AddWordPage(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomePage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    WelcomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeScreen(),
        settings: data,
      );
    },
  };
}

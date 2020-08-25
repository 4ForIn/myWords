// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../views/pages/pages.dart';

class Routes {
  static const String welcomeScreen = '/';
  static const String counterPage = '/counter-page';
  static const String loginPage = '/login-page';
  static const all = <String>{
    welcomeScreen,
    counterPage,
    loginPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.welcomeScreen, page: WelcomeScreen),
    RouteDef(Routes.counterPage, page: CounterPage),
    RouteDef(Routes.loginPage, page: LoginPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    WelcomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeScreen(),
        settings: data,
      );
    },
    CounterPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CounterPage(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginPage(),
        settings: data,
      );
    },
  };
}

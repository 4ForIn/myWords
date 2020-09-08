import 'package:auto_route/auto_route_annotations.dart';
import 'package:my_words/views/pages/pages.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute<dynamic>(page: AddWordPage, fullscreenDialog: true),
    MaterialRoute<dynamic>(page: HomePage),
    MaterialRoute<dynamic>(page: LoginPage, fullscreenDialog: true),
    MaterialRoute<dynamic>(page: WelcomeScreen, initial: true),
  ],
)
class $Router {}

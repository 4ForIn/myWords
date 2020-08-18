import 'package:auto_route/auto_route_annotations.dart';
import 'package:my_words/views/pages/pages.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute<dynamic>(page: WelcomeScreen, initial: true),
    MaterialRoute<dynamic>(page: CounterPage, fullscreenDialog: true),
    MaterialRoute<dynamic>(page: LoginPage),
  ],
)
class $Router {}

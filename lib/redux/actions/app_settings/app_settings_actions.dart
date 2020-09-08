import 'package:my_words/models/models.dart';
import 'package:my_words/services/database/db_user_service.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class CheckForLoggedInUserAction {}

class SetLoggedUserAction {}

class NoLoggedUserAction {}

class DarkModeOnAction {}

class DarkModeOffAction {}

ThunkAction<AppState> checkForLoggedInUser() {
  return (Store<AppState> store) async {
    try {
      final User user = await DbUserService.getUserDataFromDb();
      if (user != null && user.uid != null) {
        // ignore: avoid_print
        print('checkForLoggedInUser1: ${user.uid}');
        store.dispatch(SetLoggedUserAction());
      } else {
        store.dispatch(NoLoggedUserAction);
      }
    } catch (e) {
      // ignore: avoid_print
      print('checkForLoggedInUser ERROR: ${e.message}');
    }
  };
}

/* 
ThunkAction<AppState> resetPassword(String email) {
  return (Store<AppState> store) async {
    try {
      store.dispatch(CheckForLoggedInUserAction());
    } catch (e) {
      // ignore: avoid_print
      print('resetPassword ERROR: ${e.message}');
    }
  };
}

*/

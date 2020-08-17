import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<User> userReducer = combineReducers<User>([
  TypedReducer<User, FakeAction>(fakeReducer),
]);

User fakeReducer(User currentUser, FakeAction action) {
  return currentUser;
}

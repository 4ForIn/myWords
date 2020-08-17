import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:redux/redux.dart';

Reducer<User> userReducer = combineReducers<User>([
  TypedReducer<User, Fake2Action>(_fakeReducer),
]);

User _fakeReducer(User currentUser, Fake2Action action) {
  return currentUser;
}

import 'package:my_words/models/models.dart';
import 'package:my_words/redux/reducers/reducers.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

Store<AppState> createReduxStore() {
  return Store<AppState>(
    rootReducer,
    initialState: AppState.initialState(),
    middleware: [thunkMiddleware],
  );
}

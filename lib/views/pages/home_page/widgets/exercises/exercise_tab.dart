import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';
import 'package:my_words/views/pages/home_page/widgets/portrait_card_widget.dart';
import 'package:redux/redux.dart';

class ExerciseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //StoreProvider.of<AppState>(context).dispatch(getFromDb());
    return StoreConnector<AppState, _ExerciseTabViewModel>(
      converter: (Store<AppState> store) =>
          _ExerciseTabViewModel.fromStore(store),
      builder: (BuildContext context, _ExerciseTabViewModel vm) => Expanded(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0 * SizeConfig.widthMultiplier,
                vertical: 3.5 * SizeConfig.heightMultiplier,
              ),
              child: Text(
                AppStrings.notAvailable,
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(fontSize: 2.5 * SizeConfig.textMultiplier), //18
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    PortraitCard(
                      imagePath: Images.spider,
                      lessonName: 'Favorite',
                      numberOfCourses: vm.wordsList
                          .where((word) => word.isFavorite == 1)
                          .toList()
                          .length
                          .toString(),
                      wordsList: vm.wordsList
                          .where((element) => element.isFavorite == 1)
                          .toList(),
                    ),
                    const PortraitCard(
                      imagePath: Images.flower,
                      lessonName: 'Lesson 1',
                      numberOfCourses: "0",
                    ),
                    const PortraitCard(
                      imagePath: Images.insect,
                      lessonName: 'Lesson 2',
                      numberOfCourses: "0",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.0 * SizeConfig.widthMultiplier,
                vertical: 5 * SizeConfig.heightMultiplier,
              ),
              child: Text(
                AppStrings.underProd,
                style: Theme.of(context)
                    .textTheme
                    .headline2
                    .copyWith(fontSize: 3 * SizeConfig.textMultiplier), //22
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseTabViewModel {
  final List<WordModel> wordsList;
  final String radioGrVal;
  final Function radioGrValHandler;
  final Function deleteWordFromDb;
  final Function searchByLanguage;

  _ExerciseTabViewModel(
      {@required this.wordsList,
      this.radioGrVal,
      this.radioGrValHandler,
      this.deleteWordFromDb,
      this.searchByLanguage});

  // ignore: prefer_constructors_over_static_methods
  static _ExerciseTabViewModel fromStore(Store<AppState> store) {
    return _ExerciseTabViewModel(
        wordsList: store.state.wordsList,
        radioGrVal: store.state.homePageState.selectLanguageRadioListGrVal,
        deleteWordFromDb: () => store.dispatch(FakeAction),
        radioGrValHandler: () => store.dispatch(FakeAction),
        searchByLanguage: () => store.dispatch(FakeAction));
  }
}

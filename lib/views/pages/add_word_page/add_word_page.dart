import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/view_models/add_word_page_vm/add_word_page_vm.dart';

class AddWordPage extends StatefulWidget {
  const AddWordPage({
    Key key,
  }) : super(key: key);

  @override
  _AddWordPageState createState() => _AddWordPageState();
}

class _AddWordPageState extends State<AddWordPage> {
  final GlobalKey<FormState> _newWordFormKey = GlobalKey<FormState>();
  String _en, _pl, _tr, _category; // variables for use in form
  //WordsDatabase database;

  @override
  void initState() {
    super.initState();
    //database = WordsDatabase();
    //database.initDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: AppTheme.topBarBackgroundColor,
          title: Text('Add new word',
              style: Theme.of(context).textTheme.headline6),
        ),
        body: SafeArea(
          bottom: false,
          left: false,
          right: false,
          child: ListView(
            children: <Widget>[
              buildTitle(context),
              buildTitleUnderline(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: Form(
                  key: _newWordFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      buildEnInput(context),
                      buildPlInput(context),
                      buildTrInput(context),
                      buildCategoryInput(context),
                      const SizedBox(
                        // this is only padding
                        height: 30.0,
                      ),
                      buildBtn(context),
                      const SizedBox(
                        // this is only padding
                        height: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  SizedBox buildBtn(BuildContext context) {
    return SizedBox(
      height: 50.0,
      width: 270.0,
      child: FlatButton(
        color: AppTheme.topBarBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(3 * SizeConfig.heightMultiplier)),
        onPressed: addWordBtnFn,
        child: Text(
          'Add new word',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }

  /// buildAddNewWordBtn onPressed:
  void addWordBtnFn() {
    if (_newWordFormKey.currentState.validate()) {
      _newWordFormKey.currentState.save();
      createWordObject(en: _en, pl: _pl, tr: _tr, category: _category);
      AddWordPageViewModel.addNewWord(
          createWordObject(en: _en, pl: _pl, tr: _tr, category: _category));
      ExtendedNavigator.root.pop();
    }
  }

  WordModel createWordObject(
      {String en, String pl, String tr, String category}) {
    final String dateOfCreation = DateTime.now().toString();
    final WordModel newWordItem = WordModel(
      category: category,
      date: dateOfCreation.substring(0, 19),
      en: en,
      id: dateOfCreation.trim(),
      isFavorite: 0,
      pl: pl,
      tr: tr,
    );
    return newWordItem;
  }

  String validationHandle(String input) {
    if (input.isNotEmpty) {
      return null;
    } else {
      return 'Please type a word';
    }
  }

  Row buildEnInput(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          AppStrings.newEnWord,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4 * SizeConfig.widthMultiplier),
          child: SizedBox(
            width: 32 * SizeConfig.widthMultiplier,
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'in english', enabledBorder: InputBorder.none),
              onSaved: (enInput) => _en = enInput,
              validator: (enInput) => validationHandle(enInput),
            ),
          ),
        ),
      ],
    );
  }

  Row buildPlInput(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          AppStrings.newPlWord,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4 * SizeConfig.widthMultiplier),
          child: SizedBox(
            width: 32 * SizeConfig.widthMultiplier,
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'in polish', enabledBorder: InputBorder.none),
              onSaved: (plInput) => _pl = plInput,
              validator: (plInput) {
                if (plInput.isNotEmpty) {
                  return null;
                } else {
                  return 'Please type a word';
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Row buildTrInput(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          AppStrings.newTrWord,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4 * SizeConfig.widthMultiplier),
          child: SizedBox(
            width: 32 * SizeConfig.widthMultiplier,
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'in turkish', enabledBorder: InputBorder.none),
              onSaved: (trInput) => _tr = trInput,
              // ignore: missing_return
              validator: (trInput) {
                if (trInput.isEmpty) {
                  return 'Please type a word';
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Row buildCategoryInput(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          AppStrings.newWordCategory,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4 * SizeConfig.widthMultiplier),
          child: SizedBox(
            width: 30 * SizeConfig.widthMultiplier,
            child: TextFormField(
              decoration: const InputDecoration(
                  labelText: 'category', enabledBorder: InputBorder.none),
              onSaved: (categoryInput) => _category = categoryInput,
              // ignore: missing_return
            ),
          ),
        ),
      ],
    );
  }

  Padding buildTitleUnderline() {
    return Padding(
      // odsunięcie lini od lewej i prawej
      padding: EdgeInsets.only(
          top: 0.3 * SizeConfig.heightMultiplier,
          left: 5 * SizeConfig.widthMultiplier,
          right: 5 * SizeConfig.widthMultiplier),
      child: Align(
        //alignment: Alignment.center,
        // bez tego linia jest na środku szer.
        child: Container(
          //width: ,//100 * SizeConfig.widthMultiplier
          height: 0.5 * SizeConfig.heightMultiplier,
          color: AppTheme.subTitleTextColor,
        ),
      ),
    );
  }

  SizedBox buildTitle(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Align(
        //alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 1.1 * SizeConfig.widthMultiplier,
              vertical: 2 * SizeConfig.heightMultiplier),
          child: Text(
            AppStrings.addNewWordTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ),
    );
  }
}

/* class _AddNewWordViewModel {
  final List<WordModel> wordsList;

  _AddNewWordViewModel({
    this.wordsList,
  });

  // ignore: prefer_constructors_over_static_methods
  static _AddNewWordViewModel fromStore(Store<AppState> store) {
    return _AddNewWordViewModel(
      wordsList: store.state.wordsList,
    );
  }

  
}
 */
/* 
new StoreConnector<int, String>(
                  converter: (store) => store.state.toString(),
                  builder: (context, count) {
                    return new Text(

floatingActionButton: new StoreConnector<int, VoidCallback>(
            converter: (store) {             
              return () => store.dispatch(Actions.Increment);
            },
            builder: (context, callback) {
              return new FloatingActionButton(
*/

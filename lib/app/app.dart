import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_words/config/app_strings.dart';
import 'package:my_words/config/size_config.dart';
import 'package:my_words/config/styles.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/views/views.dart';
import 'package:redux/redux.dart';

class MyWordsApp extends StatelessWidget {
  final Store<AppState> store;

  const MyWordsApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: LayoutBuilder(builder: (context, constraints) {
        // constraints gives us screen height and width: constraints.maxHeight
        return OrientationBuilder(builder: (context, orientation) {
          //Orientation.portrait or .landscape
          SizeConfig().getOrientation(constraints, orientation);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Make dictionary',
            theme: AppTheme.lightTheme,
            // lightTheme, darkTheme
            initialRoute: AppStrings.welcomeScr,
            routes: {
              AppStrings.welcomeScr: (context) => WelcomeScreen(),
              AppStrings.signInScr: (context) => MyApp(),
              //'/login': (context) => LoginScreen(),
            },
          );
        });
      }),
    );
  }
}

/// temporary:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'how many times',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.selectedTabBackgroundColor,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

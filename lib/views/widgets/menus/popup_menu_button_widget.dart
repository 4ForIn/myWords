import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/redux/actions/actions.dart';

class PopUpMenuButtonWidget extends StatelessWidget {
  const PopUpMenuButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<_MenuItems>(
      icon: Icon(Icons.blur_on, size: 8 * SizeConfig.imageSizeMultiplier),
      itemBuilder: (BuildContext context) {
        return _menuData.map(
          (choice) {
            return PopupMenuItem<_MenuItems>(
              value: choice,
              child: Row(
                children: <Widget>[
                  Icon(
                    choice.icon,
                    color: Colors.green,
                  ),
                  Text(choice.title),
                ],
              ),
            );
          },
        ).toList();
      },
      onSelected: (menuData) => onSelectFn(menuData, context),
    );
  }

  Set<Set<void>> onSelectFn(_MenuItems menuData, BuildContext context) {
    return {
      if (menuData.path == '/addNew' || menuData.path == '/counter-page')
        {ExtendedNavigator.of(context).push(menuData.path)}
      else if (menuData.path == '/logout')
        {
          StoreProvider.of<AppState>(context).dispatch(FakeAction),
          // ignore: avoid_print
          print('dispatch(FakeAction)'),
        }
      else
        // ignore: avoid_print
        {print('some fn')}
    };
  }
}

class _MenuItems {
  const _MenuItems({this.title, this.icon, this.path});

  final String title;
  final IconData icon;
  final String path;
}

const List<_MenuItems> _menuData = <_MenuItems>[
  _MenuItems(title: ' Light mode', icon: Icons.wb_sunny, path: ''),
  _MenuItems(title: ' Dark mode', icon: Icons.brightness_3, path: ''),
  _MenuItems(title: ' Add word', icon: Icons.add, path: '/addNew'),
  _MenuItems(title: ' Log out', icon: MdiIcons.logout, path: '/counter-page'),
  _MenuItems(title: ' Home', icon: Icons.home, path: '/home'),
];

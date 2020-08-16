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
      onSelected: (menuData) => {
        if (menuData.iconPath == '/addNew' || menuData.iconPath == '/home')
          {Navigator.of(context).pushNamed(menuData.iconPath)}
        else if (menuData.iconPath == '/logout')
          {
            StoreProvider.of<AppState>(context).dispatch(FakeAction),
            // ignore: avoid_print
            print('dispatch(FakeAction)'),
          }
        else
          // ignore: avoid_print
          {print('some fn')}
      },
    );
  }
}

class _MenuItems {
  const _MenuItems({this.title, this.icon, this.iconPath});

  final String title;
  final IconData icon;
  final String iconPath;
}

const List<_MenuItems> _menuData = <_MenuItems>[
  _MenuItems(title: ' Light mode', icon: Icons.wb_sunny, iconPath: ''),
  _MenuItems(title: ' Dark mode', icon: Icons.brightness_3, iconPath: ''),
  _MenuItems(title: ' Add word', icon: Icons.add, iconPath: '/addNew'),
  _MenuItems(title: ' Log out', icon: MdiIcons.logout, iconPath: '/logout'),
  _MenuItems(title: ' Home', icon: Icons.home, iconPath: '/home'),
];

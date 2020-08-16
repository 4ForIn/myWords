import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(Icons.search, size: 3 * SizeConfig.heightMultiplier),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 1 * SizeConfig.heightMultiplier,
              vertical: 1 * SizeConfig.heightMultiplier,
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
              ),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
      ],
    );
  }
}

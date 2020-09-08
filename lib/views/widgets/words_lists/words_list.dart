import 'package:flutter/material.dart';
import 'package:my_words/models/models.dart';
import 'package:my_words/views/widgets/app_widgets.dart';

class WordsListWidget extends StatelessWidget {
  final List<WordModel> wordsList;

  const WordsListWidget({
    this.wordsList,
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      //shrinkWrap: false,
      //scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(8),
      itemCount: wordsList.isEmpty ? 0 : wordsList.length,
      itemBuilder: (BuildContext context, int index) => WordTileWidget(
        context: context,
        index: index,
        key: key,
        list: wordsList,
      ),
      separatorBuilder: (BuildContext context, int index) => const Divider(
        height: 1,
        thickness: 4,
      ),
    );
  }
}

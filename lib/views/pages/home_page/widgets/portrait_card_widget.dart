import 'package:flutter/material.dart';
import 'package:my_words/config/config.dart';
import 'package:my_words/models/models.dart';

class PortraitCard extends StatelessWidget {
  final String imagePath, lessonName, numberOfCourses;
  final List<WordModel> wordsList;

  const PortraitCard(
      {Key key,
      this.imagePath,
      this.lessonName,
      this.numberOfCourses,
      this.wordsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: 4.5 * SizeConfig.widthMultiplier),
      //4.5 * SizeConfig.widthMultiplier
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(3 * SizeConfig.heightMultiplier),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            //flex: 5,
            child: CardMainContent(
              imagePath: imagePath,
              lessonName: lessonName,
              wordsList: wordsList,
            ),
          ),
          buildImageSubtitle(context),
        ],
      ),
    );
  }

  Padding buildImageSubtitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.8 * SizeConfig.widthMultiplier),
      //2.0 * SizeConfig.widthMultiplier
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            lessonName,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold),
          ),
          // ignore: prefer_if_elements_to_conditional_expressions
          lessonName == AppStrings.favored
              ? Text(
                  "$numberOfCourses words",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(fontSize: 1.55 * SizeConfig.textMultiplier),
                )
              : Text(
                  "$numberOfCourses Courses",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
        ],
      ),
    );
  }
}

class CardMainContent extends StatelessWidget {
  const CardMainContent({
    Key key,
    @required this.imagePath,
    @required this.lessonName,
    this.wordsList,
  }) : super(key: key);

  final String imagePath;
  final String lessonName;
  final List<WordModel> wordsList;

  @override
  Widget build(BuildContext context) {
    if (lessonName == AppStrings.favored) {
      return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(3 * SizeConfig.heightMultiplier),
        ),
        child: AspectRatio(
          aspectRatio: 0.8,
          child: Container(
            decoration: const BoxDecoration(
              color: AppTheme.topBarBackgroundColor,
            ),
            child: Column(
              children: [
                Expanded(
                  child: wordsList.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: wordsList.isEmpty ? 0 : wordsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              visualDensity: SizeConfig.isPortrait
                                  ? VisualDensity.comfortable
                                  : VisualDensity.compact,
                              leading: SizeConfig.isPortrait
                                  ? Icon(
                                      Icons.star_half,
                                      size: 3 * SizeConfig.imageSizeMultiplier,
                                    )
                                  : null,
                              title: Text(
                                wordsList[index].en,
                                style: TextStyle(
                                    fontSize: SizeConfig.isPortrait
                                        ? 1.8 * SizeConfig.textMultiplier
                                        : 1.3 * SizeConfig.textMultiplier),
                              ),
                              subtitle: Text(
                                '${wordsList[index].tr}  ||  ${wordsList[index].pl}',
                                style: TextStyle(
                                    fontSize: SizeConfig.isPortrait
                                        ? 1.5 * SizeConfig.textMultiplier
                                        : 1.2 * SizeConfig.textMultiplier),
                              ),
                            );
                          })
                      : Center(
                          child: ListTile(
                            title: Text(
                              AppStrings.noFavored,
                              style: TextStyle(
                                fontSize: SizeConfig.isPortrait
                                    ? 2 * SizeConfig.textMultiplier
                                    : 1.3 * SizeConfig.textMultiplier,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(3 *
              SizeConfig.heightMultiplier), //3 * SizeConfig.heightMultiplier
        ),
        child: AspectRatio(
          aspectRatio: 0.82,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    }
  }
}

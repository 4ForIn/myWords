import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

// like: part 'freezed_classes.g.dart';
part 'word.freezed.dart';
part 'word.g.dart';

@freezed
abstract class WordModel with _$WordModel {
  const factory WordModel(
      {String category,
      String date,
      String en,
      String id,
      int isFavorite,
      String pl,
      String tr}) = _WordModel;

// do not need toJson method
  factory WordModel.fromJson(Map<String, dynamic> json) =>
      _$WordModelFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_WordModel _$_$_WordModelFromJson(Map<String, dynamic> json) {
  return _$_WordModel(
    category: json['category'] as String,
    date: json['date'] as String,
    en: json['en'] as String,
    id: json['id'] as String,
    isFavorite: json['isFavorite'] as int,
    pl: json['pl'] as String,
    tr: json['tr'] as String,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_WordModelToJson(_$_WordModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'date': instance.date,
      'en': instance.en,
      'id': instance.id,
      'isFavorite': instance.isFavorite,
      'pl': instance.pl,
      'tr': instance.tr,
    };

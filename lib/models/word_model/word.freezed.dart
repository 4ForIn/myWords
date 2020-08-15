// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
WordModel _$WordModelFromJson(Map<String, dynamic> json) {
  return _WordModel.fromJson(json);
}

class _$WordModelTearOff {
  const _$WordModelTearOff();

// ignore: unused_element
  _WordModel call(
      {String category,
      String date,
      String en,
      String id,
      int isFavorite,
      String pl,
      String tr}) {
    return _WordModel(
      category: category,
      date: date,
      en: en,
      id: id,
      isFavorite: isFavorite,
      pl: pl,
      tr: tr,
    );
  }
}

// ignore: unused_element
const $WordModel = _$WordModelTearOff();

mixin _$WordModel {
  String get category;
  String get date;
  String get en;
  String get id;
  int get isFavorite;
  String get pl;
  String get tr;

  Map<String, dynamic> toJson();
  $WordModelCopyWith<WordModel> get copyWith;
}

abstract class $WordModelCopyWith<$Res> {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) then) =
      _$WordModelCopyWithImpl<$Res>;
  $Res call(
      {String category,
      String date,
      String en,
      String id,
      int isFavorite,
      String pl,
      String tr});
}

class _$WordModelCopyWithImpl<$Res> implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._value, this._then);

  final WordModel _value;
  // ignore: unused_field
  final $Res Function(WordModel) _then;

  @override
  $Res call({
    Object category = freezed,
    Object date = freezed,
    Object en = freezed,
    Object id = freezed,
    Object isFavorite = freezed,
    Object pl = freezed,
    Object tr = freezed,
  }) {
    return _then(_value.copyWith(
      category: category == freezed ? _value.category : category as String,
      date: date == freezed ? _value.date : date as String,
      en: en == freezed ? _value.en : en as String,
      id: id == freezed ? _value.id : id as String,
      isFavorite: isFavorite == freezed ? _value.isFavorite : isFavorite as int,
      pl: pl == freezed ? _value.pl : pl as String,
      tr: tr == freezed ? _value.tr : tr as String,
    ));
  }
}

abstract class _$WordModelCopyWith<$Res> implements $WordModelCopyWith<$Res> {
  factory _$WordModelCopyWith(
          _WordModel value, $Res Function(_WordModel) then) =
      __$WordModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String category,
      String date,
      String en,
      String id,
      int isFavorite,
      String pl,
      String tr});
}

class __$WordModelCopyWithImpl<$Res> extends _$WordModelCopyWithImpl<$Res>
    implements _$WordModelCopyWith<$Res> {
  __$WordModelCopyWithImpl(_WordModel _value, $Res Function(_WordModel) _then)
      : super(_value, (v) => _then(v as _WordModel));

  @override
  _WordModel get _value => super._value as _WordModel;

  @override
  $Res call({
    Object category = freezed,
    Object date = freezed,
    Object en = freezed,
    Object id = freezed,
    Object isFavorite = freezed,
    Object pl = freezed,
    Object tr = freezed,
  }) {
    return _then(_WordModel(
      category: category == freezed ? _value.category : category as String,
      date: date == freezed ? _value.date : date as String,
      en: en == freezed ? _value.en : en as String,
      id: id == freezed ? _value.id : id as String,
      isFavorite: isFavorite == freezed ? _value.isFavorite : isFavorite as int,
      pl: pl == freezed ? _value.pl : pl as String,
      tr: tr == freezed ? _value.tr : tr as String,
    ));
  }
}

@JsonSerializable()
class _$_WordModel with DiagnosticableTreeMixin implements _WordModel {
  const _$_WordModel(
      {this.category,
      this.date,
      this.en,
      this.id,
      this.isFavorite,
      this.pl,
      this.tr});

  factory _$_WordModel.fromJson(Map<String, dynamic> json) =>
      _$_$_WordModelFromJson(json);

  @override
  final String category;
  @override
  final String date;
  @override
  final String en;
  @override
  final String id;
  @override
  final int isFavorite;
  @override
  final String pl;
  @override
  final String tr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WordModel(category: $category, date: $date, en: $en, id: $id, isFavorite: $isFavorite, pl: $pl, tr: $tr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WordModel'))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('en', en))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('isFavorite', isFavorite))
      ..add(DiagnosticsProperty('pl', pl))
      ..add(DiagnosticsProperty('tr', tr));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _WordModel &&
            (identical(other.category, category) ||
                const DeepCollectionEquality()
                    .equals(other.category, category)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.en, en) ||
                const DeepCollectionEquality().equals(other.en, en)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isFavorite, isFavorite) ||
                const DeepCollectionEquality()
                    .equals(other.isFavorite, isFavorite)) &&
            (identical(other.pl, pl) ||
                const DeepCollectionEquality().equals(other.pl, pl)) &&
            (identical(other.tr, tr) ||
                const DeepCollectionEquality().equals(other.tr, tr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(category) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(en) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isFavorite) ^
      const DeepCollectionEquality().hash(pl) ^
      const DeepCollectionEquality().hash(tr);

  @override
  _$WordModelCopyWith<_WordModel> get copyWith =>
      __$WordModelCopyWithImpl<_WordModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_WordModelToJson(this);
  }
}

abstract class _WordModel implements WordModel {
  const factory _WordModel(
      {String category,
      String date,
      String en,
      String id,
      int isFavorite,
      String pl,
      String tr}) = _$_WordModel;

  factory _WordModel.fromJson(Map<String, dynamic> json) =
      _$_WordModel.fromJson;

  @override
  String get category;
  @override
  String get date;
  @override
  String get en;
  @override
  String get id;
  @override
  int get isFavorite;
  @override
  String get pl;
  @override
  String get tr;
  @override
  _$WordModelCopyWith<_WordModel> get copyWith;
}

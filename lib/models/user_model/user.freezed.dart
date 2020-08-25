// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

class _$UserTearOff {
  const _$UserTearOff();

// ignore: unused_element
  _User call(
      {String email,
      String name,
      String password,
      String userImageUrl,
      String uid}) {
    return _User(
      email: email,
      name: name,
      password: password,
      userImageUrl: userImageUrl,
      uid: uid,
    );
  }
}

// ignore: unused_element
const $User = _$UserTearOff();

mixin _$User {
  String get email;
  String get name;
  String get password;
  String get userImageUrl;
  String get uid;

  Map<String, dynamic> toJson();
  $UserCopyWith<User> get copyWith;
}

abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String email,
      String name,
      String password,
      String userImageUrl,
      String uid});
}

class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object email = freezed,
    Object name = freezed,
    Object password = freezed,
    Object userImageUrl = freezed,
    Object uid = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed ? _value.email : email as String,
      name: name == freezed ? _value.name : name as String,
      password: password == freezed ? _value.password : password as String,
      userImageUrl: userImageUrl == freezed
          ? _value.userImageUrl
          : userImageUrl as String,
      uid: uid == freezed ? _value.uid : uid as String,
    ));
  }
}

abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String email,
      String name,
      String password,
      String userImageUrl,
      String uid});
}

class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object email = freezed,
    Object name = freezed,
    Object password = freezed,
    Object userImageUrl = freezed,
    Object uid = freezed,
  }) {
    return _then(_User(
      email: email == freezed ? _value.email : email as String,
      name: name == freezed ? _value.name : name as String,
      password: password == freezed ? _value.password : password as String,
      userImageUrl: userImageUrl == freezed
          ? _value.userImageUrl
          : userImageUrl as String,
      uid: uid == freezed ? _value.uid : uid as String,
    ));
  }
}

@JsonSerializable()
class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {this.email, this.name, this.password, this.userImageUrl, this.uid});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String email;
  @override
  final String name;
  @override
  final String password;
  @override
  final String userImageUrl;
  @override
  final String uid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(email: $email, name: $name, password: $password, userImageUrl: $userImageUrl, uid: $uid)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('userImageUrl', userImageUrl))
      ..add(DiagnosticsProperty('uid', uid));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.userImageUrl, userImageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.userImageUrl, userImageUrl)) &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(userImageUrl) ^
      const DeepCollectionEquality().hash(uid);

  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {String email,
      String name,
      String password,
      String userImageUrl,
      String uid}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get email;
  @override
  String get name;
  @override
  String get password;
  @override
  String get userImageUrl;
  @override
  String get uid;
  @override
  _$UserCopyWith<_User> get copyWith;
}

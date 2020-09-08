// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    email: json['email'] as String,
    name: json['name'] as String,
    password: json['password'] as String,
    userImageUrl: json['userImageUrl'] as String,
    uid: json['uid'] as String,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'password': instance.password,
      'userImageUrl': instance.userImageUrl,
      'uid': instance.uid,
    };

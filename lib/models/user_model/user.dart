import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User(
      {String email,
      String name,
      String password,
      String userImageUrl,
      String uid}) = _User;

  // do not need toJson method
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

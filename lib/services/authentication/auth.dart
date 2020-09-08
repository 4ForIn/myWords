import 'package:my_words/models/models.dart';

abstract class BaseAuth {
  Future<void> deleteUser();

  Future<User> getCurrentUser();

  Future<bool> isEmailVerified();

  Future<void> sendEmailVerification();

  Future<void> sendPasswordResetMail(String email);

  Future<String> signIn(String email, String password);

  Future<void> signOut();

  Future<String> signUp(String email, String password);
}

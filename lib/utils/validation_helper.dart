// ignore: avoid_classes_with_only_static_members
class HelpValidate {
  static String emailValidationInfo;
  static String passwordValidationInfo;

  static bool isEmailValid(String email) {
    if (email != null) {
      if (email.length < 5 ||
          !email.contains('@') ||
          !email.contains('.') ||
          email.contains(',')) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static String email(String emailInput) {
    if (isEmailValid(emailInput)) {
      return 'Please type a valid email address';
    } else {
      return null;
    }
  }

  static String emailLabel(String emailInput) {
    if (isEmailValid(emailInput) || emailInput.isEmpty) {
      emailValidationInfo = 'Email address';
      return 'Email address';
    } else {
      emailValidationInfo = 'Email is not valid';
      return 'Email is not valid';
    }
  }

  static String password(String passwordInput) {
    if (passwordInput.isEmpty) {
      return 'Please type a password';
    } else {
      return null;
    }
  }

  static String passwordLabel(String passwordInput) {
    if (passwordInput.isEmpty) {
      return 'Password';
    } else if (passwordInput.isNotEmpty && passwordInput.length < 6) {
      return 'Password is not strong!';
    } else {
      return 'Password';
    }
  }
}

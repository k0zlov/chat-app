class TextInputValidator {
  TextInputValidator._();

  static String? validatePassword(String password) {
    if(password == '') return null;
    if(password.length < 8) return 'Password should be longer than 7 symbols.';
    return null;
  }

  static String? validateEmail(String email) {
    if(email == '') return null;
    if(!email.contains('@') || email.length < 4) return 'Invalid email.';
    return null;
  }

  static String? validateName(String name) {
    if(name == '') return null;
    if(name.length < 2) return 'Name should be at least 2 symbols long.';
    return null;
  }
}

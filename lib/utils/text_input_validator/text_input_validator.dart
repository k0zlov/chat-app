class TextInputValidator {
  TextInputValidator._();

  static String validatePassword(String password) {
    if(password == '') return 'Password is empty.';
    if(password.length < 8) return 'Password should be longer than 7 symbols.';
    return '';
  }

  static String validateEmail(String email) {
    if(email == '') return 'Email is empty.';
    if(!email.contains('@') && email.length < 4) return 'Invalid email.';
    return '';
  }

  static String validateName(String name) {
    if(name == '') return 'Name is empty.';
    if(name.length < 2) return 'Name should be at least 2 symbols long.';
    return '';
  }
}

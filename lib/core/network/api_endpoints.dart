/// SOme
// enum APIEndpoints {
//   postLogin('/'),
//   postRegistration('/');
//
//   const APIEndpoints(this.path);
//
//   final String path;
// }

class APIEndpoints {
  APIEndpoints._();

  static const String postLogin = '/users/login';

  static const String postRegistration = '/users/sign-up';
}

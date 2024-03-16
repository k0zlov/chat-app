/// A utility class containing the endpoints for the API related to user actions.
///
/// This class is not meant to be instantiated or extended. It provides
/// constant string values representing the endpoints for user login and
/// registration actions within the application's API. These constants can
/// be used throughout the app to ensure consistency and reduce the likelihood
/// of typos in endpoint strings.
class APIEndpoints {
  // Private constructor to prevent instantiation.
  APIEndpoints._();

  /// The endpoint for user login.
  ///
  /// This endpoint is used in API calls related to logging in a user.
  /// It should be appended to the base URL of the API to construct the full
  /// URL for the login request.
  static const String postLogin = '/users/login';

  /// The endpoint for user registration.
  ///
  /// This endpoint is used in API calls related to registering a new user.
  /// It should be combined with the base URL of the API to construct the full
  /// URL for the registration request.
  static const String postRegistration = '/users/sign-up';
}

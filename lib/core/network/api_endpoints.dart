/// A utility class containing the endpoints for the API related to user actions.
///
/// This class is not meant to be instantiated or extended. It provides
/// constant string values representing the endpoints for user login and
/// registration actions within the application's API. These constants can
/// be used throughout the app to ensure consistency and reduce the likelihood
/// of typos in endpoint strings.
class ApiEndpoints {
  // Private constructor to prevent instantiation.
  ApiEndpoints._();

  /// Auth Route
  static const authRoute = '/auth';

  static const getAuthUser = authRoute;

  static const postLogin = '$authRoute/login';

  static const postRegistration = '$authRoute/register';

  static const postRefreshToken = '$authRoute/refresh';

  static const postLogout = '$authRoute/logout';

  /// Contacts Route
  static const contactsRoute = '/contacts';

  static const getContacts = contactsRoute;

  static const postContactAdd = '$contactsRoute/add';

  static const deleteContactRemove = '$contactsRoute/remove';

  static const getContactsSearch = '$contactsRoute/search';

  /// Chats
  static const getChats = '/chats';
  static const postJoinChat = '/chats/join';
  static const postLeaveChat = '/chats/leave';
  static const postCreateChat = '/chats';

  static const getMessages = '/messages/chat';
  static const postSendMessage = '/messages/send';
}

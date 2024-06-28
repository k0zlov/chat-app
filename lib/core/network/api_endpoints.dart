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

  static const putUserUpdate = '$authRoute/user/update';

  /// Contacts Route
  static const contactsRoute = '/contacts';

  static const getContacts = contactsRoute;

  static const postContactAdd = '$contactsRoute/add';

  static const deleteContactRemove = '$contactsRoute/remove';

  static const getContactsSearch = '$contactsRoute/search';

  /// Chats
  static const chatsRoute = '/chats';

  static const getChats = chatsRoute;

  static const postChatCreate = '$chatsRoute/create';

  static const deleteChatDelete = '$chatsRoute/delete';

  static const putChatUpdate = '$chatsRoute/update';

  static const putParticipantUpdate = '$chatsRoute/update-participant';

  static const postChatJoin = '$chatsRoute/join';

  static const postChatLeave = '$chatsRoute/leave';

  static const getChatsSearch = '$chatsRoute/search';

  static const postChatPin = '$chatsRoute/pin';

  static const postChatArchive = '$chatsRoute/archive';

  static const deleteChatUnpin = '$chatsRoute/unpin';

  static const deleteChatUnarchive = '$chatsRoute/unarchive';

  /// Messages
  static const messagesRoute = '/messages';

  static const postMessageSend = '$messagesRoute/send';

  static const deleteMessageDelete = '$messagesRoute/delete';

  static const putMessageUpdate = '$messagesRoute/update';
}

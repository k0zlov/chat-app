/// Abstract base class for table schemas.
///
/// Defines common methods and properties that all table classes must implement,
/// such as `tableName`, `fields`, and `createTableQuery`.
abstract class Table {
  /// Returns the name of the table.
  String get tableName;

  /// Returns a map of field names and their SQL data types.
  Map<String, String> fields();

  /// Generates a SQL query to create the table.
  ///
  /// Constructs the SQL `CREATE TABLE` statement using the table name and fields.
  /// Iterates over the map of fields to construct the field definitions part of the query.
  String createTableQuery() {
    final String fieldsQuery = fields()
        .entries
        .map((field) => '${field.key} ${field.value}')
        .join(', ');
    return 'CREATE TABLE $tableName ($fieldsQuery)';
  }
}

/// Table schema for 'users'.
///
/// Includes fields like user ID, username, email, phone number, and others,
/// with appropriate SQL data types and constraints such as `NOT NULL` and `PRIMARY KEY`.
class UsersTable extends Table {
  @override
  String get tableName => 'users';

  @override
  Map<String, String> fields() => {
    'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
    'userid': 'INTEGER UNIQUE',
    'username': 'TEXT NOT NULL',
    'email': 'TEXT NOT NULL',
    'phonenumber': 'TEXT NOT NULL',
    'passwordhash': 'TEXT NOT NULL',
    'createdat': 'TEXT NOT NULL',
  };
}

/// Table schema for 'chats'.
///
/// Defines fields related to chat information, such as chat ID, chat type, and creation date.
class ChatsTable extends Table {
  @override
  String get tableName => 'chats';

  @override
  Map<String, String> fields() => {
    'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
    'chatid': 'INTEGER UNIQUE',
    'chattype': 'TEXT NOT NULL',
    'createdat': 'TEXT NOT NULL',
  };
}

/// Table schema for 'messages'.
///
/// Represents the structure of the messages table, including message content, associated chat,
/// and user IDs, with foreign keys linking to the 'chats' and 'users' tables.
class MessagesTable extends Table {
  @override
  String get tableName => 'messages';

  @override
  Map<String, String> fields() => {
    'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
    'messageid': 'INTEGER UNIQUE',
    'chatid': 'INTEGER',
    'userid': 'INTEGER',
    'content': 'TEXT NOT NULL',
    'createdat': 'TEXT NOT NULL',
    'FOREIGN KEY (chatid)': 'REFERENCES ${ChatsTable().tableName}(chatid)',
    'FOREIGN KEY (userid)': 'REFERENCES ${UsersTable().tableName}(userid)',
  };
}

/// Table schema for 'chatparticipants'.
///
/// Details the participants of a chat, their roles, and the time they joined the chat,
/// with foreign keys to the 'chats' and 'users' tables.
class ChatParticipantsTable extends Table {
  @override
  String get tableName => 'chatparticipants';

  @override
  Map<String, String> fields() => {
    'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
    'chatid': 'INTEGER',
    'userid': 'INTEGER',
    'role': 'TEXT NOT NULL',
    'joinedat': 'TEXT NOT NULL',
    'FOREIGN KEY (chatid)': 'REFERENCES ${ChatsTable().tableName}(chatid)',
    'FOREIGN KEY (userid)': 'REFERENCES ${UsersTable().tableName}(userid)',
    'UNIQUE': '(userid, chatid)',
  };
}

/// Table schema for 'contacts'.
///
/// Manages user contacts, including a reference to the user ID and the contact's user ID,
/// with both fields linked to the 'users' table to enforce referential integrity.
class ContactsTable extends Table {
  @override
  String get tableName => 'contacts';

  @override
  Map<String, String> fields() => {
    'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
    'contactuserid': 'INTEGER UNIQUE',
    'userid': 'INTEGER',
    'addedat': 'TEXT NOT NULL',
    'FOREIGN KEY (userid)': 'REFERENCES ${UsersTable().tableName}(userid)',
    'FOREIGN KEY (contactuserid)': 'REFERENCES ${UsersTable().tableName}(userid)',
    'CHECK': '(contactuserid != userid)',
    'UNIQUE': '(contactuserid, userid)',
  };
}

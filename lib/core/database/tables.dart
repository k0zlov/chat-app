/// An abstract class that serves as a blueprint for table schema definitions.
///
/// This class outlines essential elements and operations for defining a database table,
/// including the table's name, its fields, and the SQL statement to create the table.
abstract class Table {
  /// The name of the table.
  String get tableName;

  /// A dictionary of the table's fields, mapping field names to their SQL contacts types.
  Map<String, String> fields();

  /// Constructs a SQL `CREATE TABLE` statement.
  ///
  /// This method generates the SQL command required to create the table with its fields
  /// and associated contacts types, formatted according to SQL syntax standards.
  String createTableQuery() {
    final String fieldsQuery = fields()
        .entries
        .map((field) => '${field.key} ${field.value}')
        .join(', ');
    return 'CREATE TABLE $tableName ($fieldsQuery)';
  }
}

/// Represents the schema for a 'users' table in the database.
///
/// This class defines the structure and constraints of the 'users' table,
/// including essential fields like user ID, username, and contact information.
class UsersTable extends Table {
  @override
  String get tableName => 'users';

  @override
  Map<String, String> fields() => {
        'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'user_id': 'INTEGER UNIQUE',
        'name': 'TEXT NOT NULL',
        'email': 'TEXT NOT NULL',
      };
}

/// Describes the schema for a 'chats' table in the database.
///
/// Outlines the fields relevant to chat sessions, such as chat ID and type,
/// ensuring each chat is uniquely identified and categorized.
class ChatsTable extends Table {
  @override
  String get tableName => 'chats';

  @override
  Map<String, String> fields() => {
        'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'chat_id': 'INTEGER UNIQUE',
        'chat_type': 'TEXT NOT NULL',
        'created_at': 'TEXT NOT NULL',
      };
}

/// Defines the schema for a 'messages' table in the database.
///
/// Captures message details within chats, including sender, content, and timestamps,
/// with references to the 'chats' and 'users' tables to maintain relational integrity.
class MessagesTable extends Table {
  @override
  String get tableName => 'messages';

  @override
  Map<String, String> fields() => {
        'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'message_id': 'INTEGER UNIQUE',
        'chat_id': 'INTEGER',
        'user_id': 'INTEGER',
        'content': 'TEXT NOT NULL',
        'created_at': 'TEXT NOT NULL',
      };
}

/// Specifies the schema for a 'chatparticipants' table in the database.
///
/// Details the association of users to chat rooms, their roles within those chats,
/// and the time they joined, incorporating references to 'chats' and 'users' for integrity.
class ChatParticipantsTable extends Table {
  @override
  String get tableName => 'chatparticipants';

  @override
  Map<String, String> fields() => {
        'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'chat_id': 'INTEGER',
        'user_id': 'INTEGER',
        'role': 'TEXT NOT NULL',
        'joined_at': 'TEXT NOT NULL',
      };
}

/// Outlines the schema for a 'contacts' table in the database.
///
/// Manages user connections by storing references to user IDs and their contacts,
/// enforcing constraints to prevent duplication and self-referencing.
class ContactsTable extends Table {
  @override
  String get tableName => 'contacts';

  @override
  Map<String, String> fields() => {
        'id': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'name': 'TEXT NOT NULL',
        'email': 'TEXT NOT NULL UNIQUE',
      };
}

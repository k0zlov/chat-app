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
        'external_id': 'INTEGER NOT NULL UNIQUE',
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
        'internalId': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'id': 'INTEGER NOT NULL UNIQUE',
        'title': 'TEXT NOT NULL',
        'type': 'TEXT NOT NULL',
        'isPinned': 'INTEGER NOT NULL',
        'isArchived': 'INTEGER NOT NULL',
        'description': 'TEXT',
        'createdAt': 'TEXT NOT NULL',
      };
}

/// Defines the schema for a 'messages' table in the database.
class MessagesTable extends Table {
  @override
  String get tableName => 'messages';

  @override
  Map<String, String> fields() => {
        'internalId': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'id': 'INTEGER UNIQUE',
        'chatId': 'INTEGER',
        'type': 'TEXT NOT NULL',
        'authorName': 'TEXT NOT NULL',
        'userId': 'INTEGER NOT NULL',
        'content': 'TEXT NOT NULL',
        'createdAt': 'TEXT NOT NULL',
        'updatedAt': 'TEXT NOT NULL',
      };
}

/// Specifies the schema for a 'chatparticipants' table in the database.
class ChatParticipantsTable extends Table {
  @override
  String get tableName => 'chat_participants';

  @override
  Map<String, String> fields() => {
        'internalId': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'chatId': 'INTEGER NOT NULL',
        'userId': 'INTEGER NOT NULL',
        'name': 'TEXT NOT NULL',
        'bio': 'TEXT',
        'role': 'TEXT NOT NULL',
        'joinedAt': 'TEXT NOT NULL',
        'lastActivityAt': 'TEXT NOT NULL',
      };
}

/// Outlines the schema for a 'contacts' table in the database.
class ContactsTable extends Table {
  @override
  String get tableName => 'contacts';

  @override
  Map<String, String> fields() => {
        'internalId': 'INTEGER PRIMARY KEY AUTOINCREMENT',
        'contactUserId': 'INTEGER NOT NULL UNIQUE',
        'name': 'TEXT NOT NULL',
        'bio': 'TEXT',
        'email': 'TEXT NOT NULL UNIQUE',
        'addedAt': 'TEXT NOT NULL',
        'lastActivityAt': 'TEXT NOT NULL',
      };
}

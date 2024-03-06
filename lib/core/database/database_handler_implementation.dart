import 'package:chat_app/core/database/database_handler.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/di_container.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// An implementation of [DatabaseHelper] to manage database operations.
///
/// This class provides functionalities to initialize the database, execute
/// CRUD operations, and manage error handling. It leverages the Singleton
/// pattern for database instance management to ensure only one instance is
/// created throughout the app lifecycle.
class DatabaseHelperImpl implements DatabaseHelper {
  /// Constructs an instance of [DatabaseHelperImpl].
  ///
  /// Upon instantiation of the class, the database initialization process
  /// is automatically triggered by invoking the [_init] method. This ensures
  /// that the database is ready for use immediately after the [DatabaseHelperImpl]
  /// instance is created.
  DatabaseHelperImpl() {
    _init();
  }

  /// Initializes the database asynchronously.
  ///
  /// This method sets up the database by calling `_initDatabase` and signals
  /// the readiness of this class instance to the `GetIt` service locator.
  Future<void> _init() async {
    _database = await _initDatabase();
    getIt.signalReady(this);
  }

  /// The instance of the database.
  ///
  /// This variable holds the singleton instance of the SQLite database.
  Database? _database;

  /// List of table definitions
  List<Table> get tables => [
    UsersTable(),
    ChatsTable(),
    MessagesTable(),
    ChatParticipantsTable(),
    ContactsTable(),
  ];

  /// Ensures a singleton instance of the database.
  ///
  /// This getter method lazily initializes the database if it hasn't been
  /// initialized yet. It ensures that any operation using the database will
  /// have a valid instance to work with.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initializes and returns a reference to the app's SQLite database.
  ///
  /// This method generates the full path for the database file named 'chat_app.db'
  /// and leverages the `openDatabase` method from the `sqflite` package to either
  /// open the database if it exists or create it if it doesn't. During the database
  /// creation phase, it sets up the schema by invoking the `_onCreate` callback.
  /// Additionally, it configures the database with the `_onConfigure` callback to
  /// ensure proper settings, such as enabling foreign key support.
  ///
  /// Returns:
  /// A `Future` that completes with the `Database` instance, ready for use.
  Future<Database> _initDatabase() async {
    // Constructs the full path to the SQLite database file.
    final String path = join(await getDatabasesPath(), 'chat_app.db');

    // Opens the database, creating it if it doesn't exist, and applies
    // configuration and creation logic through the specified callbacks.
    return openDatabase(
      path,
      version: 1, // Sets the schema version of the database.
      onCreate: _onCreate, // Callback to create the schema if the database is new.
      onConfigure: _onConfigure, // Callback to configure the database settings.
    );
  }

  /// Configures the database upon initialization.
  ///
  /// Specifically, this method enables SQLite's foreign key constraint support,
  /// which is crucial for maintaining referential integrity across table relationships.
  ///
  /// Parameters:
  ///   - [db]: The `Database` instance being configured.
  ///
  /// Note:
  /// This method is typically invoked by the `openDatabase` method during the
  /// database initialization process.
  Future<void> _onConfigure(Database db) async {
    // Enables foreign key constraints to ensure referential integrity.
    await db.execute('PRAGMA foreign_keys = ON');
  }


  /// Defines the schema of the database on its creation.
  ///
  /// This callback method is executed the first time the database is created.
  /// It iterates over a list of table definitions, executing their respective
  /// `createTableQuery` to set up the initial database schema.
  Future<void> _onCreate(Database db, int newVersion) async {
    for (final table in tables) {
      await db.execute(table.createTableQuery());
    }
  }

  @override
  Future<Either<Failure, T>> get<T>({
    required String tableName,
    required T Function(Map<String, dynamic> json) parser,
    String? where,
    List<dynamic>? whereArgs,
  }) async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> response = await db.query(
        tableName,
        where: where,
        whereArgs: whereArgs,
      );

      final parsedResponse = parser({'items': response});
      return Right(parsedResponse);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }

      const cacheFailure = CacheFailure(
        errorMessage: 'Could not retrieve data from local database',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<void> insert<T>({
    required String tableName,
    required T data,
    required Map<String, dynamic> Function(T data) parser,
  }) async {
    try {
      final db = await database;
      final parsedData = parser(data);

      await db.insert(tableName, parsedData);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }
    }
  }

  @override
  Future<void> update<T>({
    required String tableName,
    required T data,
    required Map<String, dynamic> Function(T data) parser,
    required String where,
    required List<dynamic> whereArgs,
  }) async {
    try {
      final db = await database;
      final parsedData = parser(data);

      await db.update(
        tableName,
        parsedData,
        where: where,
        whereArgs: whereArgs,
      );
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }
    }
  }

  @override
  Future<void> delete({
    required String tableName,
    required String where,
    required List<dynamic> whereArgs,
  }) async {
    try {
      final db = await database;

      await db.delete(tableName, where: where, whereArgs: whereArgs);
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error: $e \nStack trace:\n $stackTrace');
      }
    }
  }
}

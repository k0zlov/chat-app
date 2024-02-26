import 'package:chat_app/core/database/database.dart';
import 'package:chat_app/core/database/tables.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/di_container.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// An implementation of [DatabaseHandler] to manage database operations.
///
/// This class provides functionalities to initialize the database, execute
/// CRUD operations, and manage error handling. It leverages the Singleton
/// pattern for database instance management to ensure only one instance is
/// created throughout the app lifecycle.
class DatabaseHandlerImpl implements DatabaseHandler {
  /// Constructs an instance of [DatabaseHandlerImpl].
  ///
  /// Upon instantiation of the class, the database initialization process
  /// is automatically triggered by invoking the [_init] method. This ensures
  /// that the database is ready for use immediately after the [DatabaseHandlerImpl]
  /// instance is created.
  DatabaseHandlerImpl() {
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

  /// Creates and opens the database.
  ///
  /// This method constructs the database path and initializes it with
  /// necessary tables through the `_onCreate` callback.
  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'chat_app.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }
  
  /// Defines the schema of the database on its creation.
  ///
  /// This callback method is executed the first time the database is created.
  /// It iterates over a list of table definitions, executing their respective
  /// `createTableQuery` to set up the initial database schema.
  Future<void> _onCreate(Database db, int newVersion) async {
    final List<Table> tables = [
      UsersTable(),
      ChatsTable(),
      MessagesTable(),
      ChatParticipantsTable(),
      ContactsTable(),
    ];

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

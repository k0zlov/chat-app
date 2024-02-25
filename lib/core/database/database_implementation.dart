import 'package:chat_app/core/database/database.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// Implementation of the [DatabaseHandler] interface for performing database operations.
class DatabaseHandlerImpl implements DatabaseHandler {
  /// The instance of the database.
  Database? _database;

  /// Retrieves the database instance, initializing it if necessary.
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// Initializes the database.
  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'chat_app.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE chats(
        chatid INTEGER PRIMARY KEY,
        chattype TEXT,
        createdat TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE messages(
        messageid INTEGER PRIMARY KEY,
        chatid INTEGER,
        userid INTEGER,
        content TEXT,
        createdat TEXT
      )
    ''');
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

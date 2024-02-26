import 'package:chat_app/core/database/database.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/template_feature/data/models/user_model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract interface class UsersLocalProvider {
  Future<Either<Failure, UserResponse>> getCachedUsers();

  Future<void> cacheUser({required UserModel userModel});

  Future<void> updateCachedUser({required UserModel userModel});

  Future<void> deleteCachedUser({required UserModel userModel});
}

class UsersLocalProviderImpl implements UsersLocalProvider {
  const UsersLocalProviderImpl({
    required this.databaseHandler,
  });

  final DatabaseHandler databaseHandler;

  @override
  Future<Either<Failure, UserResponse>> getCachedUsers() async {
    final response = await databaseHandler.get(
      tableName: 'users',
      parser: UserResponse.fromJson,
    );
    return response;
  }

  @override
  Future<void> cacheUser({required UserModel userModel}) async {
    await databaseHandler.insert(
      tableName: 'users',
      data: userModel,
      parser: (model) => model.toJson(),
    );
  }

  @override
  Future<void> updateCachedUser({required UserModel userModel}) async {
    await databaseHandler.update(
      tableName: 'users',
      data: userModel,
      parser: (model) => model.toJson(),
      where: 'userid = ?',
      whereArgs: [userModel.userid],
    );
  }

  @override
  Future<void> deleteCachedUser({required UserModel userModel}) async {
    await databaseHandler.delete(
      tableName: 'users',
      where: 'userid = ?',
      whereArgs: [userModel.userid],
    );
  }
}

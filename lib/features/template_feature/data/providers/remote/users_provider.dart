import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/template_feature/data/models/user_model/user_model.dart';
import 'package:dartz/dartz.dart';

/// Interface for user-related data providers.
///
/// Implementations of this interface should provide methods to interact with
/// user data, such as fetching users and inserting new users.
abstract interface class UsersProvider {
  /// Fetches a list of users from the data source.
  ///
  /// Returns a [Future] that resolves to an [Either] containing either a
  /// [Failure] if the operation fails, or a [UserResponse] if successful.
  Future<Either<Failure, UserResponse>> fetchUsers();

  /// Inserts a new user into the data source.
  ///
  /// The [userModel] parameter specifies the user to be inserted.
  Future<void> insertUser({required UserModel userModel});
}

/// Implementation of the [UsersProvider] interface using the provided [Network]
///
/// This implementation interacts with the network layer
/// to perform user-related operations
class UsersProviderImpl implements UsersProvider {
  /// Constructs a [UsersProviderImpl] instance with the specified [Network].
  const UsersProviderImpl({
    required this.network,
  });

  /// The network layer used for performing user-related operations.
  final Network network;

  @override
  Future<Either<Failure, UserResponse>> fetchUsers() async {
    final response = await network.get(
      tableName: 'users',
      orderColumn: 'createdat',
      isAscendingOrder: false,
      // filterColumn: 'userid',
      // filterOperator: 'gt',
      limit: 3,
      // filterValue: 3,
      parser: UserResponse.fromJson,
    );
    return response;
  }

  @override
  Future<void> insertUser({required UserModel userModel}) async {
    await network.post(
      tableName: 'users',
      data: userModel,
      parser: (_) => userModel.toJson(),
    );
  }
}
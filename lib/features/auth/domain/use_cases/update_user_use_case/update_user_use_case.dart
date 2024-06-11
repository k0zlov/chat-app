import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_use_case.freezed.dart';

part 'update_user_use_case.g.dart';

/// Use case class for updating user information.
///
/// This class implements the [UseCase] interface, providing a concrete implementation
/// for updating user details using an [AuthRepository].
class UpdateUserUseCase implements UseCase<UserEntity, UpdateUserParams> {
  /// Constructs an [UpdateUserUseCase] with the given repository.
  ///
  /// The [repository] is required to handle the update operation.
  const UpdateUserUseCase({
    required this.repository,
  });

  /// The repository that handles the update operation.
  final AuthRepository repository;

  /// Calls the repository to update user information with the provided parameters.
  ///
  /// This method overrides the [UseCase] interface's call method. It delegates
  /// the update operation to the [repository].
  ///
  /// Parameters:
  /// - [params]: An instance of [UpdateUserParams] containing the user information to be updated.
  ///
  /// Returns:
  /// - A [Future] which completes with an [Either] containing a [Failure] on the left side
  ///   in case of an error, or a [UserEntity] on the right side upon success.
  @override
  Future<Either<Failure, UserEntity>> call(UpdateUserParams params) {
    return repository.updateUser(params);
  }
}

/// Parameters for updating user information.
///
/// This class uses the [freezed] package to generate immutable data classes
/// and union types, providing a clean and consistent API for updating user details.
@freezed
class UpdateUserParams with _$UpdateUserParams {
  /// Constructs an [UpdateUserParams] instance with optional name and bio fields.
  ///
  /// The fields [name] and [bio] default to null if not provided.
  const factory UpdateUserParams({
    @Default(null) String? name,
    @Default(null) String? bio,
  }) = _UpdateUserParams;

  /// Private constructor for [UpdateUserParams] to enable custom methods.
  const UpdateUserParams._();

  /// Creates an [UpdateUserParams] instance from a JSON map.
  ///
  /// This factory constructor allows deserialization of the parameters from JSON.
  factory UpdateUserParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserParamsFromJson(json);
}

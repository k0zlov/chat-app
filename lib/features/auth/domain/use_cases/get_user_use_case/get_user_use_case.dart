import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase implements UseCase<UserEntity, NoParams> {
  const GetUserUseCase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    return repository.getCurrentUser();
  }
}

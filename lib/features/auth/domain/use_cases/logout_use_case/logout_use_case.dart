import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase implements UseCase<void, NoParams> {
  const LogoutUseCase({
    required this.repository,
  });

  final AuthRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return repository.logout();
  }
}

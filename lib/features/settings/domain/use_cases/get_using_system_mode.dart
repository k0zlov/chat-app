import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

class GetUsingSystemModeUseCase implements UseCase<bool, NoParams> {
  const GetUsingSystemModeUseCase({
    required this.repository,
  });

  final SettingsRepository repository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return repository.getUsingSystemMode();
  }
}

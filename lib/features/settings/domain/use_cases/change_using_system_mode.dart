import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/settings_feature.dart';
import 'package:dartz/dartz.dart';

class ChangeUsingSystemModeUseCase
    implements UseCase<void, ChangeUsingSystemModeParams> {
  const ChangeUsingSystemModeUseCase({
    required this.repository,
  });

  final SettingsRepository repository;

  @override
  Future<Either<Failure, void>> call(ChangeUsingSystemModeParams params) async {
    return repository.setUsingSystemMode(params);
  }
}

class ChangeUsingSystemModeParams {
  const ChangeUsingSystemModeParams({required this.usingSystemMode});

  final bool usingSystemMode;
}

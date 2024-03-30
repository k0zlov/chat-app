import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeThemeColorUseCase implements UseCase<void, ChangeThemeColorParams> {
  ChangeThemeColorUseCase({required this.repository});

  final SettingsRepository repository;

  @override
  Future<Either<Failure, void>> call(ChangeThemeColorParams params) {
    return repository.setThemeColor(params);
  }
}

class ChangeThemeColorParams {
  const ChangeThemeColorParams({
    required this.color,
  });

  final AppThemeColor color;
}

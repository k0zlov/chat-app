import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

class ChangeThemeModeUseCase implements UseCase<void, ChangeThemeModeParams> {
  ChangeThemeModeUseCase({required this.repository});

  final SettingsRepository repository;

  @override
  Future<Either<Failure, void>> call(ChangeThemeModeParams params) async {
    return repository.setThemeMode(params);
  }
}

class ChangeThemeModeParams {
  const ChangeThemeModeParams({
    required this.mode,
  });

  final AppThemeMode mode;
}

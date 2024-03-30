import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

class GetThemeModeUseCase implements UseCase<ThemeModeEntity, NoParams> {
  const GetThemeModeUseCase({required this.repository});

  final SettingsRepository repository;

  @override
  Future<Either<Failure, ThemeModeEntity>> call(NoParams params) {
    return repository.getThemeMode();
  }
}

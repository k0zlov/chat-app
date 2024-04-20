import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/settings/data/data_providers/local/settings_local_data_provider.dart';
import 'package:chat_app/features/settings/domain/entities/theme_color_entity/theme_color_entity.dart';
import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_color.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_mode.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_using_system_mode.dart';
import 'package:dartz/dartz.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl({required this.localProvider});

  final SettingsLocalDataProvider localProvider;

  @override
  Future<Either<Failure, ThemeColorEntity>> getThemeColor() async {
    final failureOrModel = await localProvider.getThemeColor();

    return failureOrModel.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) {
        final ThemeColorEntity entity = model.toEntity();
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, ThemeModeEntity>> getThemeMode() async {
    final failureOrModel = await localProvider.getThemeMode();

    return failureOrModel.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) {
        final ThemeModeEntity entity = model.toEntity();
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, bool>> getUsingSystemMode() {
    return localProvider.getUsingSystemMode();
  }

  @override
  Future<Either<Failure, void>> setThemeColor(
    ChangeThemeColorParams params,
  ) {
    return localProvider.setThemeColor(params);
  }

  @override
  Future<Either<Failure, void>> setThemeMode(
    ChangeThemeModeParams params,
  ) {
    return localProvider.setThemeMode(params);
  }

  @override
  Future<Either<Failure, void>> setUsingSystemMode(
    ChangeUsingSystemModeParams params,
  ) {
    return localProvider.setUsingSystemMode(params);
  }
}

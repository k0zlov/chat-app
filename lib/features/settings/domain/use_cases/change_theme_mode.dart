import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

/// The [ChangeThemeModeUseCase] class implements the use case for changing the theme mode.
/// This class follows the [UseCase] interface, with `void` as the return type
/// and [ChangeThemeModeParams] as the parameters type.
class ChangeThemeModeUseCase implements UseCase<void, ChangeThemeModeParams> {
  /// Creates an instance of [ChangeThemeModeUseCase].
  ///
  /// - `repository`: The repository that handles settings-related operations.
  ChangeThemeModeUseCase({required this.repository});

  /// The repository that handles settings-related operations.
  final SettingsRepository repository;

  /// Calls the use case to change the theme mode with the given parameters.
  ///
  /// This method uses the repository to set the theme mode and returns a [Future]
  /// of [Either] containing [Failure] or `void`.
  @override
  Future<Either<Failure, void>> call(ChangeThemeModeParams params) {
    return repository.setThemeMode(params);
  }
}

/// The [ChangeThemeModeParams] class represents the parameters required to change the theme mode.
class ChangeThemeModeParams {
  /// Creates a [ChangeThemeModeParams] instance.
  ///
  /// - `mode`: The new theme mode to be set.
  const ChangeThemeModeParams({
    required this.mode,
  });

  /// The new theme mode to be set.
  final Brightness mode;
}

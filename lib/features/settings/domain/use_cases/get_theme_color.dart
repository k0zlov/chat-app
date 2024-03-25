import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/entities/theme_color_entity/theme_color_entity.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

class GetThemeColorUseCase implements UseCase<ThemeColorEntity, NoParams> {
  const GetThemeColorUseCase({required this.repository});

  final SettingsRepository repository;

  @override
  Future<Either<Failure, ThemeColorEntity>> call(NoParams params) async {
    return repository.getThemeColor();
  }
}

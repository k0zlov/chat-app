import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/features/auth/data/models/token_model/token_model.dart';
import 'package:chat_app/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteProvider {
  Future<Either<Failure, TokenModel>> signUp(SignUpParams params);
}

class AuthRemoteProviderImpl implements AuthRemoteProvider {
  const AuthRemoteProviderImpl({
    required this.network,
  });

  final Network network;

  @override
  Future<Either<Failure, TokenModel>> signUp(SignUpParams params) async {
    final Either<Failure, TokenModel> response = await network.post(
      url: '/users/sign-up',
      data: params.toJson(),
      parser: (json) {
        final data = json as Map<String, dynamic>;
        return TokenModel.fromJson(data);
      },
    );
    return response;
  }
}

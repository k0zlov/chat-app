import 'package:chat_app/application.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenFactory {
  ScreenFactory._();

  static Widget renderApplication() {
    return BlocProvider.value(
      value: getIt<AuthCubit>(),
      child: const ChatApplication(),
    );
  }
}

import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/core/widgets/blur/blurred_loading_screen.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:chat_app/features/settings/view/cubit/settings_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatApplication extends StatelessWidget {
  const ChatApplication({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Brightness deviceBrightness =
        MediaQuery.of(context).platformBrightness;

    final SettingsState settingsState = context.select(
      (SettingsCubit cubit) => cubit.state,
    );

    return CupertinoApp.router(
      title: 'Chat-App',
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.themeData(
        color: settingsState.themeColor.color,
        brightness: settingsState.usingSystemBrightness
            ? settingsState.currentBrightness
            : deviceBrightness,
      ),
      routerConfig: AppNavigation.router,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
      ],
      builder: (context, child) {
        return BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state.authInProcess) {
              return BlurredBackgroundLoading(
                backgroundWidget: child ?? const CupertinoActivityIndicator(),
              );
            }
            return child ?? const CupertinoActivityIndicator();
          },
        );
      },
    );
  }
}

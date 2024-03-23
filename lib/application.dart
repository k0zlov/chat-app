import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/blur/blurred_loading_screen.dart';
import 'package:chat_app/core/widgets/modal_pop_up.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatApplication extends StatelessWidget {
  const ChatApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthCubit cubit = context.read<AuthCubit>();

    return CupertinoApp.router(
      title: 'Chat-App',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
      routerConfig: AppNavigation.router,
      builder: (context, child) {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.authError != '') {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                if (AppNavigation.rootNavigatorKey.currentContext == null) {
                  return;
                }
                showCupertinoModalPopup<void>(
                  context: AppNavigation.rootNavigatorKey.currentContext!,
                  builder: (BuildContext context) {
                    return ModalPopUpContainer(
                      iconData: CupertinoIcons.exclamationmark_triangle_fill,
                      message: state.authError,
                    );
                  },
                );
                cubit.clearAuthError();
              });
            }
          },
          builder: (context, state) {
            if (state.authInProcess) {
              return BlurredBackgroundLoading(
                backgroundWidget: child ?? const SizedBox(),
              );
            }
            return child ?? const SizedBox();
          },
        );
      },
    );
  }
}

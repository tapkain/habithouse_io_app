import 'package:flutter/material.dart';
import 'package:habithouse_io/state/auth_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:overlay_support/overlay_support.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    ref.listen<AsyncValue>(
      authProvider,
      (oldAuth, newAuth) {
        newAuth.maybeWhen(
          error: (error, stackTrace) => showSimpleNotification(
            Text(error.toString()),
            background: Colors.green,
          ),
          orElse: () {},
        );
      },
    );

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TextField(controller: emailController),
            TextField(controller: passwordController),
            OutlinedButton(
              onPressed: () => ref
                  .read(authProvider.notifier)
                  .signUp(emailController.text, passwordController.text),
              child: Text('LOGIN'),
            ),
          ],
        ),
      ),
    );
  }
}

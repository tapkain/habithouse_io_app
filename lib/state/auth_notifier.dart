import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthNotifier extends StateNotifier<AsyncValue<Session>> {
  AuthNotifier() : super(const AsyncValue.loading()) {
    final session = Supabase.instance.client.auth.session();
    if (session != null) {
      state = AsyncValue.data(session);
    }

    _onAuthStateListener =
        Supabase.instance.client.auth.onAuthStateChange((event, session) {
      log.info(event.toString());
      log.info(session?.toJson().toString());

      if (session != null) {
        state = AsyncValue.data(session);
      } else {
        state = const AsyncValue.loading();
      }
    });
  }

  void signIn(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      log.info('Signing in to $email');
      final res = await Supabase.instance.client.auth
          .signIn(email: email, password: password);

      if (res.error != null) {
        throw Exception(res.error!.message);
      }

      if (res.data == null) {
        throw Exception('Invalid email');
      }

      return res.data!;
    });
  }

  void signUp(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      log.info('Signing up with $email');
      final res = await Supabase.instance.client.auth.signUp(email, password);

      if (res.error != null) {
        throw Exception(res.error!.message);
      }

      if (res.data == null) {
        throw Exception('Invalid email');
      }

      return res.data!;
    });
  }

  void signOut() => Supabase.instance.client.auth.signOut();

  @override
  void dispose() {
    _onAuthStateListener.data?.unsubscribe();
    super.dispose();
  }

  final log = Logger('AuthState');
  late final GotrueSubscription _onAuthStateListener;

  bool get isSignedIn => state.mapOrNull(data: (_) => true) == true;
}

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<Session>>(
  (_) => AuthNotifier(),
);

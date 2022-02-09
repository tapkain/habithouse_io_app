import 'package:go_router/go_router.dart';
import 'package:habithouse_io/models/create_habit_form.dart';
import 'package:habithouse_io/state/auth_notifier.dart';
import 'package:habithouse_io/views/create_child_habit_view.dart';
import 'package:habithouse_io/views/create_habit_view.dart';
import 'package:habithouse_io/views/home_view.dart';
import 'package:habithouse_io/views/preview_habit_view.dart';
import 'package:habithouse_io/views/select_child_habits_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerProvider = Provider((ref) {
  final auth = ref.watch(authProvider.notifier);
  return GoRouter(
    initialLocation: '/habits',
    routes: [
      GoRoute(
        path: '/habits',
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
            path: 'view/:habitid',
            builder: (context, state) => PreviewHabitView(
              habitId: int.parse(state.params['habitid']!),
            ),
            routes: [
              GoRoute(
                path: 'edit/:childhabitid',
                builder: (context, state) => CreateChildHabitView(
                  parentHabitId: int.parse(state.params['habitid']!),
                  editHabitId: int.parse(state.params['childhabitid']!),
                ),
              ),
              GoRoute(
                path: 'select',
                builder: (context, state) => SelectChildHabitsView(
                  habitId: int.parse(state.params['habitid']!),
                ),
                routes: [
                  GoRoute(
                    path: 'create',
                    builder: (context, state) => CreateChildHabitView(
                      parentHabitId: int.parse(state.params['habitid']!),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'edit/:habitid',
            builder: (context, state) => CreateHabitView(
              editHabitId: int.parse(state.params['habitid']!),
            ),
          ),
          GoRoute(
            path: 'create',
            builder: (context, state) => const CreateHabitView(),
          ),
        ],
      ),
    ],
    refreshListenable: GoRouterRefreshStream(auth.stream),
  );
});

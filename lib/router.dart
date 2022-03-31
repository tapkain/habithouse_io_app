import 'package:go_router/go_router.dart';
import 'package:habithouse_io/state/auth_notifier.dart';
import 'package:habithouse_io/views/create_child_habit_view.dart';
import 'package:habithouse_io/views/create_habit_view.dart';
import 'package:habithouse_io/views/home_view.dart';
import 'package:habithouse_io/views/preview_habit_view.dart';
import 'package:habithouse_io/views/select_child_habits_view.dart';
import 'package:habithouse_io/widgets/modal_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'models/models.dart';

final routerProvider = Provider((ref) {
  final authNotifier = ref.watch(authProvider.notifier);
  return GoRouter(
    initialLocation: '/habits',
    routes: [
      GoRoute(
        path: '/',
        redirect: (_) => '/habits',
      ),
      GoRoute(
        path: '/habits',
        builder: (context, state) => const HomeView(),
        routes: [
          GoRoute(
            pageBuilder: (context, state) => ModalPage(
              key: state.pageKey,
              child: PreviewHabitView(
                habitId: int.parse(state.params['habitid']!),
              ),
            ),
            path: 'view/:habitid',
            routes: [
              GoRoute(
                path: 'edit',
                pageBuilder: (context, state) => ModalPage(
                  key: state.pageKey,
                  child: CreateHabitView(
                    editHabitId: int.parse(state.params['habitid']!),
                  ),
                ),
              ),
              GoRoute(
                path: 'child/:childhabitid/edit',
                pageBuilder: (context, state) => ModalPage(
                  key: state.pageKey,
                  child: CreateChildHabitView(
                    parentHabitId: int.parse(state.params['habitid']!),
                    editHabitId: int.parse(state.params['childhabitid']!),
                    editHabitExtra: state.extra as Habit?,
                  ),
                ),
              ),
              GoRoute(
                path: 'select',
                pageBuilder: (context, state) => ModalPage(
                  key: state.pageKey,
                  child: SelectChildHabitsView(
                    habitId: int.parse(state.params['habitid']!),
                  ),
                ),
                routes: [
                  GoRoute(
                    path: 'create',
                    pageBuilder: (context, state) => ModalPage(
                      key: state.pageKey,
                      child: CreateChildHabitView(
                        parentHabitId: int.parse(state.params['habitid']!),
                        editHabitExtra: state.extra as Habit?,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'create',
            pageBuilder: (context, state) => ModalPage(
              key: state.pageKey,
              child: const CreateHabitView(),
            ),
          ),
        ],
      ),
    ],
    refreshListenable: GoRouterRefreshStream(authNotifier.stream),
  );
});

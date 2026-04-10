import 'package:go_router/go_router.dart';
import 'package:planova_app/features/group/presentation/views/groups_view/GroupsScreen.dart';
import 'package:planova_app/features/group/presentation/views/create_groups/create_group_screen.dart';
import 'package:planova_app/features/group/presentation/views/edit_groups/edit_group_view.dart';
import 'package:planova_app/features/group/presentation/views/group_details/groups_details_view.dart';

abstract class AppRouter {
  static final kCreateGroupView = '/CreateGroupView';
  static final kGroupDetailsView = '/GroupDetailsView';
  static final kEditGroupView = '/EditGroupView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const GroupsScreen()),
      GoRoute(
        path: kCreateGroupView,
        builder: (context, state) => const CreateGroupView(),
      ),
      GoRoute(
        path: kGroupDetailsView,
        builder: (context, state) => const GroupsDetailsView(),
      ),
      GoRoute(
        path: kEditGroupView,
        builder: (context, state) => const EditGroupView(),
      ),
    ],
  );
}

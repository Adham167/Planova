import 'package:go_router/go_router.dart';
import 'package:planova_app/features/group/presentation/views/GroupsScreen.dart';
import 'package:planova_app/features/group/presentation/views/create_group_screen.dart';

abstract class AppRouter {
  static final kCreateGroupView = 'CreateGroupView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const GroupsScreen()),
      GoRoute(path: kCreateGroupView, builder: (context, state) => const CreateGroupView()),
      
    ],
  );
}

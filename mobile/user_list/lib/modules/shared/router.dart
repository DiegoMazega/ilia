import 'package:go_router/go_router.dart';
import 'package:user_list/modules/create_user/presentation/pages/create_user_page.dart';
import 'package:user_list/modules/create_user/presentation/pages/create_user_success_page.dart';
import 'package:user_list/modules/home/presentation/pages/home_page.dart';
import 'package:user_list/modules/list_user/presentation/pages/list_user_page.dart';

final GoRouter router = GoRouter(
  initialLocation: HomePage.routeName,
  routes: [
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: CreateUser_CreateUserPage.routeName,
      builder: (context, state) => const CreateUser_CreateUserPage(),
    ),
    GoRoute(
      path: CreateUser_CreateUserSuccessPage.routeName,
      builder: (context, state) => const CreateUser_CreateUserSuccessPage(),
    ),
    GoRoute(
      path: ListUser_ListUserPage.routeName,
      builder: (context, state) => const ListUser_ListUserPage(),
    ),
  ],
);

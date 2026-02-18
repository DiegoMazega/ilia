import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_cubit.dart';

class ListUser_ListUserController {
  ListUser_ListUserController({
    required this.fetchUsers,
    required this.onRefresh,
  });

  final void Function() fetchUsers;
  final Future<void> Function() onRefresh;
}

ListUser_ListUserController useListUserController(BuildContext context) {
  void fetchUsers() {
    context.read<ListUser_ListUserCubit>().fetchUsers();
  }

  Future<void> onRefresh() async {
    await context.read<ListUser_ListUserCubit>().fetchUsers();
  }

  return ListUser_ListUserController(
    fetchUsers: fetchUsers,
    onRefresh: onRefresh,
  );
}

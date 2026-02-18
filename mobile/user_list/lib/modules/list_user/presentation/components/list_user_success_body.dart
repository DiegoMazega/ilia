import 'package:flutter/material.dart';
import 'package:user_list/modules/list_user/data/models/list_user_model.dart';

class ListUser_SuccessBody extends StatelessWidget {
  const ListUser_SuccessBody({
    super.key,
    required this.users,
    required this.onRefresh,
  });

  final List<ListUser_ListUserModel> users;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Text('#${user.id}'),
          );
        },
      ),
    );
  }
}

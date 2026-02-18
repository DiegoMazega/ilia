import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:user_list/modules/shared/extensions/translate_extension.dart';
import 'package:user_list/modules/list_user/presentation/components/list_user_empty_body.dart';
import 'package:user_list/modules/list_user/presentation/components/list_user_error_body.dart';
import 'package:user_list/modules/list_user/presentation/components/list_user_loading_body.dart';
import 'package:user_list/modules/list_user/presentation/components/list_user_success_body.dart';
import 'package:user_list/modules/list_user/presentation/controllers/list_user_controller.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_cubit.dart';
import 'package:user_list/modules/list_user/presentation/cubit/list_user_state.dart';

class ListUser_ListUserPage extends HookWidget {
  const ListUser_ListUserPage({super.key});

  static const String routeName = '/list';

  @override
  Widget build(BuildContext context) {
    final translate = context.translate;
    final controller = useListUserController(context);

    useEffect(() {
      controller.fetchUsers();
      return null;
    }, [controller]);

    return Scaffold(
      appBar: AppBar(title: Text(translate.listUserTitle)),
      body: BlocBuilder<ListUser_ListUserCubit, ListUser_ListUserState>(
        builder: (context, state) {
          if (state is ListUser_ListUserLoading) {
            return const ListUser_LoadingBody();
          }

          if (state is ListUser_ListUserEmpty) {
            return ListUser_EmptyBody(onRefresh: controller.onRefresh);
          }

          if (state is ListUser_ListUserSuccess) {
            return ListUser_SuccessBody(
              users: state.users,
              onRefresh: controller.onRefresh,
            );
          }

          return ListUser_ErrorBody(onTryAgain: controller.fetchUsers);
        },
      ),
    );
  }
}

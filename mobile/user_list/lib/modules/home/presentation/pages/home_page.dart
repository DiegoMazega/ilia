import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_list/modules/create_user/presentation/pages/create_user_page.dart';
import 'package:user_list/modules/list_user/presentation/pages/list_user_page.dart';
import 'package:user_list/modules/shared/extensions/translate_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final translate = context.translate;

    return Scaffold(
      appBar: AppBar(title: Text(translate.appTitle)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      context.push(ListUser_ListUserPage.routeName),
                  icon: const Icon(Icons.list),
                  label: Text(translate.listUserTitle),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      context.push(CreateUser_CreateUserPage.routeName),
                  icon: const Icon(Icons.person_add),
                  label: Text(translate.createUserTitle),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

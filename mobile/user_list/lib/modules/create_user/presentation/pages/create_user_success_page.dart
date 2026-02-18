import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:user_list/modules/create_user/presentation/pages/create_user_page.dart';
import 'package:user_list/modules/home/presentation/pages/home_page.dart';
import 'package:user_list/modules/list_user/presentation/pages/list_user_page.dart';
import 'package:user_list/modules/shared/extensions/translate_extension.dart';

class CreateUser_CreateUserSuccessPage extends StatelessWidget {
  const CreateUser_CreateUserSuccessPage({super.key});

  static const String routeName = '/create-user-success';

  @override
  Widget build(BuildContext context) {
    final translate = context.translate;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100,
              ),
              const SizedBox(height: 24),
              Text(
                translate.userCreatedSuccess,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () => context.pushReplacement(
                    CreateUser_CreateUserPage.routeName,
                  ),
                  icon: const Icon(Icons.person_add),
                  label: Text(translate.createUserTitle),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () =>
                      context.pushReplacement(ListUser_ListUserPage.routeName),
                  icon: const Icon(Icons.list),
                  label: Text(translate.listUserTitle),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => context.go(HomePage.routeName),
                child: Text(translate.homeTitle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

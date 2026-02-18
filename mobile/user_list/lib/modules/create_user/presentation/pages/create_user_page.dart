import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:user_list/modules/create_user/presentation/controllers/create_user_controller.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_cubit.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_state.dart';
import 'package:user_list/modules/create_user/presentation/pages/create_user_success_page.dart';
import 'package:user_list/modules/shared/extensions/translate_extension.dart';

class CreateUser_CreateUserPage extends HookWidget {
  const CreateUser_CreateUserPage({super.key});

  static const String routeName = '/create-user';

  Widget? _buildErrorBanner(CreateUser_CreateUserController controller) {
    if (controller.generalError.value == null) {
      return null;
    }

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            controller.generalError.value!,
            style: const TextStyle(color: Colors.red),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final translate = context.translate;
    final controller = useCreateUserController(context);

    return Scaffold(
      appBar: AppBar(title: Text(translate.createUserTitle)),
      body:
          BlocConsumer<CreateUser_CreateUserCubit, CreateUser_CreateUserState>(
            listener: (context, state) {
              if (state is CreateUser_CreateUserSuccess) {
                controller.clear();
                context.pushReplacement(
                  CreateUser_CreateUserSuccessPage.routeName,
                );
              } else if (state is CreateUser_CreateUserError) {
                controller.handleActionError(state.errors, translate);
              }
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ?_buildErrorBanner(controller),
                    TextField(
                      controller: controller.nameController,
                      focusNode: controller.nameFocusNode,
                      decoration: InputDecoration(
                        labelText: translate.name,
                        hintText: 'Ex: Diego Duarte',
                        errorText: controller.nameError.value,
                      ),
                      onSubmitted: (_) =>
                          controller.emailFocusNode.requestFocus(),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: controller.emailController,
                      focusNode: controller.emailFocusNode,
                      decoration: InputDecoration(
                        labelText: translate.email,
                        hintText: 'Ex: diego@example.com',
                        errorText: controller.emailError.value,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSubmitted: (_) => controller.createUser(),
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(height: 24),
                    if (state is CreateUser_CreateUserLoading)
                      const CircularProgressIndicator()
                    else
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.createUser,
                          child: Text(translate.save),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
    );
  }
}

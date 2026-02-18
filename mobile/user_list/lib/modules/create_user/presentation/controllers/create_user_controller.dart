import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:user_list/l10n/app_localizations.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_cubit.dart';
import 'package:user_list/modules/create_user/presentation/cubit/create_user_error_type.dart';

class CreateUser_CreateUserController {
  CreateUser_CreateUserController({
    required this.nameController,
    required this.emailController,
    required this.nameFocusNode,
    required this.emailFocusNode,
    required this.nameError,
    required this.emailError,
    required this.generalError,
    required this.createUser,
    required this.clear,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;
  final ValueNotifier<String?> nameError;
  final ValueNotifier<String?> emailError;
  final ValueNotifier<String?> generalError;
  final void Function() createUser;
  final void Function() clear;

  void handleActionError(
    List<CreateUser_CreateUserErrorType> errors,
    AppLocalizations translate,
  ) {
    if (errors.contains(CreateUser_CreateUserErrorType.invalidName)) {
      nameError.value = translate.invalidName;
    }
    if (errors.contains(CreateUser_CreateUserErrorType.invalidEmail)) {
      emailError.value = translate.invalidEmail;
    }
    if (errors.contains(CreateUser_CreateUserErrorType.emailAlreadyExists)) {
      emailError.value = translate.errorEmailAlreadyExists;
    }
    if (errors.contains(CreateUser_CreateUserErrorType.invalidNameFormat)) {
      nameError.value = translate.errorInvalidNameFormat;
    }
    if (errors.contains(CreateUser_CreateUserErrorType.invalidEmailFormat)) {
      emailError.value = translate.errorInvalidEmailFormat;
    }
    if (errors.contains(CreateUser_CreateUserErrorType.invalidPayload)) {
      generalError.value = translate.errorInvalidPayload;
    }
    if (errors.contains(CreateUser_CreateUserErrorType.rateLimit)) {
      generalError.value = translate.errorRateLimit;
    }
    if (errors.contains(CreateUser_CreateUserErrorType.serverError)) {
      generalError.value = translate.errorInternalServer;
    }
    if (errors.contains(CreateUser_CreateUserErrorType.unknown)) {
      generalError.value = translate.error;
    }
  }
}

CreateUser_CreateUserController useCreateUserController(BuildContext context) {
  final nameController = useTextEditingController();
  final emailController = useTextEditingController();
  final nameFocusNode = useFocusNode();
  final emailFocusNode = useFocusNode();
  final nameError = useState<String?>(null);
  final emailError = useState<String?>(null);
  final generalError = useState<String?>(null);

  useEffect(() {
    void nameListener() {
      if (nameError.value != null) nameError.value = null;
      if (generalError.value != null) generalError.value = null;
    }

    void emailListener() {
      if (emailError.value != null) emailError.value = null;
      if (generalError.value != null) generalError.value = null;
    }

    nameController.addListener(nameListener);
    emailController.addListener(emailListener);

    return () {
      nameController.removeListener(nameListener);
      emailController.removeListener(emailListener);
    };
  }, [nameController, emailController]);

  void createUser() {
    nameError.value = null;
    emailError.value = null;
    generalError.value = null;

    final cubit = context.read<CreateUser_CreateUserCubit>();
    final isValid = cubit.validateUser(
      nameController.text,
      emailController.text,
    );
    if (!isValid) return;
    cubit.createUser(nameController.text, emailController.text);
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    nameError.value = null;
    emailError.value = null;
    generalError.value = null;
  }

  return CreateUser_CreateUserController(
    nameController: nameController,
    emailController: emailController,
    nameFocusNode: nameFocusNode,
    emailFocusNode: emailFocusNode,
    nameError: nameError,
    emailError: emailError,
    generalError: generalError,
    createUser: createUser,
    clear: clear,
  );
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'User List';

  @override
  String get counterMsg => 'You have pushed the button this many times:';

  @override
  String get incrementTooltip => 'Increment';

  @override
  String get name => 'Name';

  @override
  String get email => 'Email';

  @override
  String get save => 'Save';

  @override
  String get createUserTitle => 'Create User';

  @override
  String get listUserTitle => 'User List';

  @override
  String get invalidEmail => 'Please enter a valid email';

  @override
  String get invalidName => 'Please enter at least a first and last name';

  @override
  String get userCreatedSuccess => 'User created successfully!';

  @override
  String get loading => 'Loading...';

  @override
  String get error =>
      'An error occurred, check your internet connection or try again later';

  @override
  String get homeTitle => 'Home Screen';

  @override
  String get emptyListMessage => 'No data to be shown. Pull down to refresh.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get errorEmailAlreadyExists => 'This email is already in use.';

  @override
  String get errorInvalidNameFormat => 'Invalid name format.';

  @override
  String get errorInvalidEmailFormat => 'Invalid email format.';

  @override
  String get errorInvalidPayload => 'Invalid data sent.';

  @override
  String get errorFetchUsers => 'Error fetching users.';

  @override
  String get errorInternalServer => 'Internal server error.';

  @override
  String get errorRateLimit => 'Too many requests. Please try again later.';

  @override
  String get createAnotherUser => 'Create another user';

  @override
  String get viewRegisteredUsers => 'View registered users';
}

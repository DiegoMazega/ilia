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
  String get error => 'An error occurred';

  @override
  String get homeTitle => 'Home Screen';

  @override
  String get emptyListMessage => 'No data to be shown. Pull down to refresh.';

  @override
  String get tryAgain => 'Try again';
}

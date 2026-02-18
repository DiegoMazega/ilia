import 'package:flutter_test/flutter_test.dart';
import 'package:user_list/modules/create_user/domain/validators/create_user_email_validator.dart';

void main() {
  group('createUser_EmailValidator', () {
    test('should return true when email is valid', () {
      expect(createUser_EmailValidator('diego@example.com'), isTrue);
    });

    test('should return false when email is missing @', () {
      expect(createUser_EmailValidator('diegoexample.com'), isFalse);
    });

    test('should return false when email is missing domain', () {
      expect(createUser_EmailValidator('diego@'), isFalse);
    });

    test('should return false when email is empty', () {
      expect(createUser_EmailValidator(''), isFalse);
    });
  });
}

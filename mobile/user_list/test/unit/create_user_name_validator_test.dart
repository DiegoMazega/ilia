import 'package:flutter_test/flutter_test.dart';
import 'package:user_list/modules/create_user/domain/validators/create_user_name_validator.dart';

void main() {
  group('createUser_NameValidator', () {
    test('should return true when name has at least two words', () {
      expect(createUser_NameValidator('Diego Duarte'), isTrue);
    });

    test('should return false when name has only one word', () {
      expect(createUser_NameValidator('Diego'), isFalse);
    });

    test('should return false when name is empty', () {
      expect(createUser_NameValidator(''), isFalse);
    });

    test('should return false when name is only whitespace', () {
      expect(createUser_NameValidator('   '), isFalse);
    });
  });
}

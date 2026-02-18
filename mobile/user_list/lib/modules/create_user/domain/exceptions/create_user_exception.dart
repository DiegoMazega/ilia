class CreateUser_CreateUserException implements Exception {
  factory CreateUser_CreateUserException.fromKey(String key) {
    return CreateUser_CreateUserException(key);
  }
  CreateUser_CreateUserException(this.key);

  final String key;
}

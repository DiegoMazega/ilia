bool createUser_EmailValidator(String email) {
  final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegExp.hasMatch(email);
}

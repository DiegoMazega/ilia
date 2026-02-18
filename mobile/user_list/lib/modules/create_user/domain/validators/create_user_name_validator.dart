bool createUser_NameValidator(String name) {
  final names = name.trim().split(' ');
  return names.length >= 2 && names.every((n) => n.isNotEmpty);
}

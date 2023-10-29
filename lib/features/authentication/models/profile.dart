enum Profile {
  admin,
  user;

  factory Profile.fromString(String value) =>
      values.firstWhere((Profile element) => element.name == value);
}

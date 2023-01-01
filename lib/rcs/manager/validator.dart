class Validators {
  bool validateEmail(String email) {
    RegExp validEmail = RegExp(
        r'^[a-zA-Z0-9.!#$%&‘+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)$');
    return validEmail.hasMatch(email);
  }
}

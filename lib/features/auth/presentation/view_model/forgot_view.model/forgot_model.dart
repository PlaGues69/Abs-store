class ForgotPasswordModel {
  bool validateEmail(String email) {
    return email.isNotEmpty && email.contains('@');
  }
}

String? validateConfirmPassword(String pass1, String pass2) {
  if (pass1.isEmpty) {
    return 'Please re-enter your password';
  } else if (pass1 != pass2) {
    return 'Passwords do not match';
  }
  return null;
}

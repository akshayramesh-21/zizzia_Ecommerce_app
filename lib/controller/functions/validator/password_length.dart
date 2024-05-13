String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Password is required';
  } else if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}

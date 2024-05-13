String? validatePhone(String value) {
  if (value.isEmpty) {
    return 'Phone number required';
  } else if (value.length < 10) {
    return 'Phone must be 10 characters long';
  }
  return null;
}

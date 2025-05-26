String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email cannot be empty';
  }
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password cannot be empty';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Name cannot be empty';
  }
  if (value.length < 2) {
    return 'Name must be at least 2 characters';
  }
  return null;
}

String? validateGender(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Gender cannot be empty';
  }
  final lower = value.toLowerCase();
  if (lower != 'male' && lower != 'female' && lower != 'other') {
    return 'Please enter male, female, or other';
  }
  return null;
}

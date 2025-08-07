String? validateUsername(String username) {
  if (username.trim().isEmpty) {
    return 'Username is required';
  } else if (username.length < 3) {
    return 'Username must be at least 3 characters';
  } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
    return 'Username contains invalid characters';
  }
  return null;
}

String? validateEmail(String email) {
  if (email.trim().isEmpty) {
    return 'Email is required';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
    return 'Invalid email format';
  }
  return null;
}

String? validatePassword(String password) {
  if (password.isEmpty) {
    return 'Password is required';
  } else if (password.length < 8) {
    return 'Password must be at least 8 characters';
  } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return 'Password must contain at least one uppercase letter';
  } else if (!RegExp(r'[0-9]').hasMatch(password)) {
    return 'Password must contain at least one number';
  }
  return null;
}

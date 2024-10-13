class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch(code) {
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials. Please double-check your information.';
      case 'too-many-request':
        return 'Too many request. Please try again.';
      case 'invalid-argument':
        return 'Invalid argument provided to the authentication method';
      case 'sign_in_failed':
        return 'Sign-in failed. Please try again.';
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email';
      case 'weak-password':
        return 'The password is too weak, Please choose a stronger password.';
      case 'user-not-found':
        return 'Invalid login details. User not found';
      case 'wrong-password':
        return ' Incorrect password. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'email-already-exists':
        return 'The email address already exists. Please use a different email';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again';
      default:
        return 'An unexpected Firebase error occurred. Please try again';
    }
  }
}
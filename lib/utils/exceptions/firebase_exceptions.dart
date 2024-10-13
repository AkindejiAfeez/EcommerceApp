class TFirebaseException implements Exception {

  final String code;

  TFirebaseException(this.code);

  String get message {
    switch (code) {
      case 'unknown' :
        return 'An unknown Firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'user-disabled':
        return 'The user account has been disabled.';
      case 'weak-password':
        return 'The password is too weak. Please choose stronger password.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'email-already-exists':
        return 'The email address already exists. Please use a different email';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'user-mismatch':
        return ' The supplied credentials do not correspond to the previously signed in user.';
      default:
        return 'An unexpected Firebase error occurred. Please try again';
    }
  }
  }
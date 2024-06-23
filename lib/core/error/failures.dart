import 'package:supabase_flutter/supabase_flutter.dart';

class Failures {
  final String message;

  Failures(this.message);
}

class ServerException extends Failures {
  ServerException(super.message);

  factory ServerException.fromAuthError(AuthException error) {
    switch (error.message) {
      case 'Invalid login credentials':
        return ServerException('Invalid email or password. Please try again.');
      case 'AuthRetryableFetchError':
        return ServerException('Please check your internet connection.');
      case 'Email not confirmed':
        return ServerException('Please confirm your email before signing in.');  
      case 'User already registered':
        return ServerException('This email is already registered. Please sign in instead.');
      case 'Password should be at least 6 characters':
        return ServerException('Password is too weak. Please use a stronger password.');  
      case 'Invalid email address':
        return ServerException('The email address is invalid. Please check and try again.'); 
      case 'User not found':
        return ServerException('No account found with this email. Please sign up first.');
      default:
        if (error.message.contains('Network error')) {
          return ServerException('Network error. Please check your internet connection.');
        } else {
          return ServerException('An unexpected error occurred. Please try again.');
        }       
    }
  }
}

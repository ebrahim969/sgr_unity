import 'package:sgr_unity/features/app/function/check_app_local.dart';
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
        return ServerException( isArabic()? 'خطأ في الايميل او كلمه المرور، حاول مجددا' :'Invalid email or password. Please try again.');
      case 'AuthRetryableFetchError':
        return ServerException(isArabic()? 'من فضلك ، تفقد اتصالك بالأنترنت' :'Please check your internet connection.');
      case 'Email not confirmed':
        return ServerException(isArabic()? 'قم بتأكيد الايميل قبل عمليه تسجيل الدخول' :'Please confirm your email before signing in.');
      case 'User already registered':
        return ServerException(
            isArabic()? 'هذا الايميل موجود بالفعل، قم بتسجيل الدخول' :'This email is already registered. Please sign in instead.');
      case 'Password should be at least 6 characters':
        return ServerException(
            isArabic()? 'كلمه المرور ضعيفه جدا' :'Password is too weak. Please use a stronger password.');
      case 'Invalid email address':
        return ServerException(
            isArabic()? 'هذا الايميل غير صحيح' :'The email address is invalid. Please check and try again.');
      case 'User not found':
        return ServerException(
            isArabic()? 'لا يوجد حساب بهذا الايميل، سجل اولا' :'No account found with this email. Please sign up first.');
      default:
        if (error.message.contains('Network error')) {
          return ServerException(
              isArabic()? 'خطأ في الشبكه، تفقد الانترنت' :'Network error. Please check your internet connection.');
        } else {
          return ServerException(
              isArabic()? 'هناك مشكله ما ، حاول مره اخري' :'An unexpected error occurred. Please try again.');
        }
    }
  }
}

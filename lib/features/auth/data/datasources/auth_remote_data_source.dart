import 'package:sgr_unity/core/error/failures.dart';
import 'package:sgr_unity/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<void> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> logInWithEmailPassword({
    required String email,
    required String password,
  });

  Session? get currentUserSession;

  Future<UserModel?> getCurrentUserData();
  Future<void> signOutUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> logInWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final response = await supabaseClient.auth
          .signInWithPassword(password: password, email: email);

      if (response.user == null) {
        throw ServerException('User is null!');
      }
      return UserModel.fromJson(response.user!.toJson())
          .copyWith(email: currentUserSession!.user.email);
    } on AuthException catch (e) {
      throw ServerException.fromAuthError(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await supabaseClient.auth
          .signUp(password: password, email: email, data: {'name': name});
    } on AuthException catch (e) {
      throw ServerException.fromAuthError(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final user = await supabaseClient
            .from('profiles')
            .select()
            .eq('id', currentUserSession!.user.id)
            .single();
        return UserModel.fromJson(user)
            .copyWith(email: currentUserSession!.user.email);
      }
      return null;
    } catch (e) {
      ServerException(e.toString());
    }
    return null;
  }

  @override
  Future<void> signOutUser() async {
    try {
      await supabaseClient.auth.signOut();
    } on AuthException catch (e) {
      throw ServerException.fromAuthError(e);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}

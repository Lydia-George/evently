import 'package:evently/core/constants/app_strings.dart';
import 'package:evently/core/networking/api_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRepo {
  final FirebaseAuth _firebaseAuth;

  RegisterRepo(this._firebaseAuth);

  /// -- REGISTER
  Future<ApiResult<String>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await userCredential.user?.updateDisplayName(name.trim());

      return Success(AppStrings.fbRegisterSuccess);

    } on FirebaseAuthException catch (error) {
      return Error(error.message ?? AppStrings.fbRegisterErrorMsg);
    }catch (error){
      return const Error(AppStrings.fbRegisterError);
    }
  }
}

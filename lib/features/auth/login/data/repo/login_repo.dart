import 'package:evently/core/constants/app_strings.dart';
import 'package:evently/core/networking/api_result.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginRepo {
  final FirebaseAuth _firebaseAuth;
  
  LoginRepo(this._firebaseAuth);
  
  Future<ApiResult<String>> login({required String email, required String password})async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email.trim(), password: password);
      return const Success(AppStrings.fbLoginSuccess);
    }on FirebaseAuthException catch(error){
      return Error(error.message ?? AppStrings.fbLoginErrorMsg);
    }catch(error){
      return const Error(AppStrings.fbLoginError);
    }
  }
}
import 'dart:async';

import 'package:evently/features/auth/data/repo/auth_repo.dart';
import 'package:evently/features/auth/presentation/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  late final StreamSubscription<User?> _authSubscription;

  AuthCubit(this._authRepo)
      : super(
      AuthState(status: AuthStatus.checking,
      )){
    _authSubscription = _authRepo.authStateChanges.listen((user){
      if(user != null){
        emit(const AuthState(status: AuthStatus.authenticated));
      }else{
        emit(const AuthState(status: AuthStatus.unauthenticated));
      }
    });
  }

  String get userName{
    return _authRepo.currentUser?.displayName ?? 'User';
  }

  Future<void> logout() async{
    await _authRepo.logout();
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }


}

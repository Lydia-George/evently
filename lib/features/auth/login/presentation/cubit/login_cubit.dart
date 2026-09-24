import 'package:evently/core/networking/api_result.dart';
import 'package:evently/features/auth/login/data/repo/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(LoginState(status: LoginStatus.initial));

  Future<void> login({required String email, required String password}) async {
    emit(const LoginState(status: LoginStatus.loading));

    final result = await _loginRepo.login(email: email, password: password);
    if (result is Success<String>) {
      emit(LoginState(status: LoginStatus.success, message: result.data));
    } else if (result is Error<String>) {
      emit(LoginState(status: LoginStatus.error, message: result.error));
    }
  }
}

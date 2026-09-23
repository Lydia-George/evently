import 'package:evently/core/networking/api_result.dart';
import 'package:evently/features/auth/register/data/repo/register_repo.dart';
import 'package:evently/features/auth/register/presentation/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo)
    : super(RegisterState(status: Status.initial));

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(RegisterState(status: Status.loading));

    final result = await _registerRepo.register(
      name: name,
      email: email,
      password: password,
    );

    if (result is Success<String>) {
      emit(RegisterState(status: Status.success, message: result.data));
    }else if (result is Error<String>) {
      emit(RegisterState(status: Status.error , message: result.error));
    }
  }
}

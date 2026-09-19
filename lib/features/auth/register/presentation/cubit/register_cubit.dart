
import 'package:evently/features/auth/register/data/repo/register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterRepo _registerRepo;
  RegisterCubit(
      this._registerRepo,
      ) : super(RegisterInitial());


  register(){
    _registerRepo.register();
  }
}

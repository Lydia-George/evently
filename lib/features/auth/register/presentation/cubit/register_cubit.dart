
import 'package:evently/features/auth/register/data/repo/register_repo.dart';
import 'package:evently/features/auth/register/presentation/cubit/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(
      this._registerRepo,
      ) : super(RegisterState(status: Status.initial));


}

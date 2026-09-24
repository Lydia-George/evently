import 'package:evently/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
              child: ElevatedButton(onPressed: (){
                context.read<AuthCubit>().logout();
              }, child: Text('Logout')),
            )));
  }
}

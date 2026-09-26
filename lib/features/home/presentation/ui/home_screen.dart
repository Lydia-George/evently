import 'package:evently/core/constants/app_strings.dart';
import 'package:evently/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:evently/features/events/data/models/event_model.dart';
import 'package:evently/features/home/presentation/widgets/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evently/features/events/ui/cubit/events_cubit.dart';
import 'package:evently/features/events/ui/cubit/events_state.dart';

import '../widgets/home_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<EventsCubit, EventsState>(
          builder: (context, state) {
            switch (state.status) {
              case EventStatus.initial:
              case EventStatus.loading:
                return Center(child: CircularProgressIndicator());

              case EventStatus.error:
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(state.message ?? AppStrings.fbLoginError),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<EventsCubit>().getEvents();
                        },
                        child: Text('Try Again'),
                      ),
                    ],
                  ),
                );

              case EventStatus.success:
                return HomeContent(events: state.events);
            }
          },
        ),
      ),
    );
  }
}


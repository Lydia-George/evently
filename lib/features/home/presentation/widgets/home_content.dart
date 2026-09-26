import 'package:evently/features/home/presentation/widgets/featured_event_card.dart';
import 'package:evently/features/home/presentation/widgets/home_section_header.dart';
import 'package:evently/features/home/presentation/widgets/upcoming_event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../events/data/models/event_model.dart';
import 'home_header.dart';

class HomeContent extends StatelessWidget {
  final List<EventModel> events;

  const HomeContent({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    final userName = context.read<AuthCubit>().userName;

    final uniqueEventsMap = <String, EventModel>{};

    for (final event in events) {
      final key = event.name
          .trim()
          .toLowerCase();

      if (!uniqueEventsMap.containsKey(key)) {
        uniqueEventsMap[key] = event;
      }
    }

    final uniqueEvents = uniqueEventsMap.values.toList();

    final featuredEvents = uniqueEvents.take(2).toList();

    final upcomingEvents = uniqueEvents.length > 2
        ? uniqueEvents.skip(2).take(5).toList()
        : events.skip(2).take(5).toList();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 18, right: 18, top: 16, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeHeader(username: userName),
            const SizedBox(height: 22),

            const Text(
              'Find your next\nexperience',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                height: 1.15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 28),

            const HomeSectionHeader(title: 'Featured Events'),

            const SizedBox(height: 14),

            SizedBox(
              height: 210,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: featuredEvents.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (context, index) {
                  return FeaturedEventCard(event: featuredEvents[index]);
                },
              ),
            ),
            const SizedBox(height: 28),
            const HomeSectionHeader(title: 'Upcoming Events'),
            const SizedBox(height: 14),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: upcomingEvents.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),

              itemBuilder: (context, index) {
                return UpcomingEventCard(event: upcomingEvents[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

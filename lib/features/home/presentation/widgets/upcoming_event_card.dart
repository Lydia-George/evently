import 'package:evently/core/theme/app_colors.dart';
import 'package:evently/features/events/data/models/event_model.dart';
import 'package:flutter/material.dart';

class UpcomingEventCard extends StatelessWidget {
  final EventModel event;

  const UpcomingEventCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final categoryColor = event.category == 'Music'
        ? AppColors.primary
        : AppColors.success;

    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
            child: SizedBox(
              width: 70,
              height: 92,
              child: Image.network(
                event.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return const ColoredBox(
                    color: AppColors.background,
                  );
                },
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (event.category.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: categoryColor.withValues(
                          alpha: 0.20,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        event.category,
                        style: TextStyle(
                          color: categoryColor,
                          fontSize: 9,
                          height: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                  const SizedBox(height: 5),

                  Text(
                    event.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 12,
                      height: 1.1,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    '${event.localDate} • ${event.localTime}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      height: 1.1,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    event.venueName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.hint,
                      fontSize: 9,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 17,
            ),
          ),
        ],
      ),
    );
  }
}
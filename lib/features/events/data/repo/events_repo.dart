import 'package:dio/dio.dart';
import 'package:evently/core/constants/app_strings.dart';
import 'package:evently/core/networking/api_constants.dart';
import 'package:evently/core/networking/api_error_handler.dart';
import 'package:evently/core/networking/api_result.dart';
import 'package:evently/features/events/data/models/event_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EventsRepo {
  final Dio _dio;

  EventsRepo(this._dio);

  Future<ApiResult<List<EventModel>>> getEvents() async {
    try {
      final apiKey = dotenv.env['TICKETMASTER_API_KEY'];

      if (apiKey == null || apiKey.isEmpty) {
        return const Error<List<EventModel>>(AppStrings.messingApiKey);
      }

      final response = await _dio.get(
        ApiConstants.eventsEndpoint,
        queryParameters: {'apikey': apiKey, 'size': 50},
      );

      final data = response.data as Map<String, dynamic>;
      final eventsJson = data['_embedded']?['events'] as List? ?? [];

      final events = eventsJson
          .map((event) => EventModel.fromJson(event as Map<String, dynamic>))
          .toList();
      return Success<List<EventModel>>(events);
    } catch (error) {
      final apiError = ApiErrorHandler.handle(error);
      return Error<List<EventModel>>(apiError.message);
    }
  }
}

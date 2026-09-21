import 'package:dio/dio.dart';
import 'package:evently/core/networking/api_error_model.dart';

class ApiErrorHandler {
  final String message;
  final int? status;

  ApiErrorHandler({
    required this.message,
    this.status,
  });

  static ApiErrorHandler handle(dynamic error) {
    if (error is DioException) {
      final statusCode= error.response?.statusCode;
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorHandler(
            message: 'Connection timeout',
            status: statusCode
          );

        case DioExceptionType.sendTimeout:
          return ApiErrorHandler(
            message: 'Send timeout',
            status: statusCode

          );

        case DioExceptionType.receiveTimeout:
          return ApiErrorHandler(
            message: 'Receive timeout',
            status: statusCode,
          );

        case DioExceptionType.connectionError:
          return ApiErrorHandler(
            message: 'No internet connection',
            status: statusCode,
          );

        case DioExceptionType.badResponse:
          final apiErrorModel = ApiErrorModel.fromJson(error.response?.data);
          return ApiErrorHandler(
            message: apiErrorModel.fault?.faultstring ?? 'Something went wrong',
            status: statusCode,
          );

        case DioExceptionType.cancel:
          return ApiErrorHandler(
            message: 'Request was cancelled',
          );

        case DioExceptionType.badCertificate:
          return ApiErrorHandler(
            message: 'Bad certificate',
          );
        case DioExceptionType.transformTimeout:
          return ApiErrorHandler(
            message: 'Response transformation timeout',
          );

        case DioExceptionType.unknown:
          return ApiErrorHandler(
            message: 'Something went wrong',
          );
      }
    }

    return ApiErrorHandler(
      message: 'Unexpected error occurred',
    );
  }

}
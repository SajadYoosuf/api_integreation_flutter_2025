import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logger.dart';

class DioHelper {
  static Future<Dio> getInstance() async {

    Dio dio = new Dio();
    dio.options.headers["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5Mjc0ZTkwMWMxZjFhMWMxYWYyZTc2OSIsImlhdCI6MTc2OTE0OTc1MywiZXhwIjoxNzc2OTI1NzUzfQ.KVfT_fsBlT8ZgUrvu3JBcplXiuTbfU1SA-2GjUBBqBA';
    dio.options.headers["Accept"] = "application/json";
    // dio.options.headers['']
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log.d(
              'API call - ' + options.method + ' - ' + options.uri.toString());
          return handler.next(options);
        },
        onError: (e, handler) {
          if (e.response != null) {
            log.d(
                'API Error - ${e.response!.statusCode} - ${e.response!.statusMessage}');
            log.d(e.response!.data);
          }
          return handler.next(e);
        },
      ),
    );
    return dio;
  }
}

import 'package:api_integreation_beginner_2025/networking/constant.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logger.dart';

class DioHelper {
  static Future<Dio> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? "");
    log.i(token);
    Dio dio = new Dio();
    // dio.options.headers["x-rapidapi-key"] = 'fa1e134807msh7db3c185f348abbp166e6cjsn96c33a712066';
    // dio.options.headers["x-rapidapi-host"] = "real-time-news-data.p.rapidapi.com";
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

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
    // dio.options.headers["x-rapidapi-key"] = 'ab220e31d7mshc19e9dc99c34aa2p1d2ff2jsn5eb82b2bb858';
    // dio.options.headers["x-rapidapi-host"] = "newsnow.p.rapidapi.com";
    // dio.options.headers["Content-Type"] = "application/json";
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

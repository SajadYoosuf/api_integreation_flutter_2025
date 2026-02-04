
import 'dart:math';

import '../networking/constant.dart';
import '../support/dio_helper.dart';

class LoginService {

  static Future login( data) async {
    try {
      print("some kind of working");
      var dio = await DioHelper.getInstance();
      var response = await dio.post('$baseUrl/auth/login',data: data);
      print(response);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

}
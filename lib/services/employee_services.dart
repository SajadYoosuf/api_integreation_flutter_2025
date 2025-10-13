
import '../networking/constant.dart';
import '../support/dio_helper.dart';

class EmployeeServices {

  static Future getAllEmployees() async {
    try {
      var dio = await DioHelper.getInstance();
      var response = await dio.get('$baseUrl/employees');
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

}

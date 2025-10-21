import 'package:api_integreation_beginner_2025/support/logger.dart';
import '../support/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:api_integreation_beginner_2025/networking/constant.dart';

class LoginService{

  static Future getAllStudents() async{
    try{
      var dio= await DioHelper.getInstance();
      var response=await dio.get("$studentUrl/studentList");
      log.i(response.data);
      return response.data;
    }catch(e){
    rethrow;
    }
  }


  static Future login(data) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.post('$studentUrl', data: data);
    return response.data;
  }
}
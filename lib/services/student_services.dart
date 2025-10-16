import '../support/dio_helper.dart';
import 'package:dio/dio.dart';
import 'package:api_integreation_beginner_2025/networking/constant.dart';

class StudentServices{

  static Future StudentDetails() async{
    try{
      var dio= await DioHelper.getInstance();
      var response=await dio.get("$studentUrl/studentList");
      return response.data;
    }catch(e){
    rethrow;
    }
  }
}
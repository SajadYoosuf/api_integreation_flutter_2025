import 'package:api_integreation_beginner_2025/networking/constant.dart';
import 'package:api_integreation_beginner_2025/support/dio_helper.dart';
import 'package:dio/dio.dart';

class NewsServices {

static  Future fetchNews() async {
    try {
      final dio=await DioHelper.getInstance();
      final response=await dio.get("$newsUrl/search");
      return response.data;
    } catch (e) {
      throw Exception('Failed to fetch news: $e');
    }
  }
}
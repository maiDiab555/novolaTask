
import 'package:dio/dio.dart';
class DioHelper {
  static Dio dio =Dio();

  static init(){
    dio =Dio(BaseOptions(
        baseUrl: "https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34",
      receiveDataWhenStatusError: true,
      connectTimeout: 60*1000, // 60 seconds
      receiveTimeout: 60*1000,));
  }

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  })async{

    dio.options.headers=
    {
      'Content-Type':'application/json',
        };
    return await dio.get(url,queryParameters: query,);
  }

}
import 'package:car_showroom/common/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ShowroomService {
  final dio = Dio();
  final storage = const FlutterSecureStorage(); 

  addCar(var data) async{
    final response = await dio.post(Urls.addCar,data: data);
    return response;
  }

 
}

import 'package:car_showroom/common/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final dio = Dio();
  final storage = const FlutterSecureStorage();

  registerUser(var data) async {
    final response = await dio.post(Urls.userRegister, data: data);
    return response;
  }

  showroomRegisterUser(var data) async {
    final response = await dio.post(Urls.showroomRegister, data: data);
    return response;
  }

  loginUser(var user) async {
    print(Urls.login);
    final response = await dio.post(Urls.login, data: user);
    print(response.data["token"]);
    print(response.data["result"]["UserType"]);
    if (response.statusCode == 201) {
      await storage.write(key: "token", value: response.data["token"]);
      await storage.write(key: "UserType", value: response.data["result"]["UserType"]);
      await storage.write(key: "id", value: response.data["result"]["_id"]);
      // await storage.write(key: "Name", value: response.data["result"]["Name"]);
      // await storage.write(key: "Email", value: response.data["result"]["Email"]);
      // await storage.write(key: "Phone", value: response.data["result"]["Phone"]);
      // await storage.write(key: "City", value: response.data["result"]["City"]);
      
      storage.read(key: "token");
      storage.read(key: "UserType");
      storage.read(key: "id");
    }

    return response;
  }
}

import 'package:expense_tracker/Models/User.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class UserController {
  String? userName;
  int tagetAmount = 30000;
  String baseUrl = 'http://192.168.29.181:9090';
  Dio dio = Dio();
  updateUserName(String name) {
    userName = name;
  }

  Future<String> loginStatus(User user) async {
    try {
      // var res = await http.post(Uri.parse('http://192.168.232.144:9090/login'),
      //     body: user.toJson());
      var res = await dio.post('$baseUrl/login', data: user.toJson());
      print('loginStatus : ' + res.data);

      return res.data;
    } catch (e) {
      print('loginStatusException : ' + e.toString());
    }
    return "";
  }

  addUser(User user) async {
    try {
      var res = await dio.post('$baseUrl/addUser', data: user.toJson());
      updateUserName(res.data['userName']);
    } catch (exception) {
      print('addUserException : ' + exception.toString());
    }
  }
}

UserController userController = UserController();

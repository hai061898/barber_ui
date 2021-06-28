import 'package:barber/data/models/auth_model.dart';
import 'package:barber/data/models/user_model.dart';
import 'package:barber/data/provider/auth_provide.dart';

class AuthRepository {
  final AuthPrivider apiClient = AuthPrivider();
  Future<Auth> login(String username, String password) async {
    Map json = await apiClient.login(username, password);
    return Auth.fromJson(json['user']);
  }
  Future<User> register(String username, String password) async {
    Map json = await apiClient.register(username, password);
    return User.fromJson(json['user']);
  }
}

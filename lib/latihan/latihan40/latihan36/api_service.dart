import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class ApiService {
  static Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<User> users = (data['data'] as List).map((user) => User.fromJson(user)).toList();
      return users;
    } else {
      throw Exception('Gagal mengambil data');
    }
  }
}

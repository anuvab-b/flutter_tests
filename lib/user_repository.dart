import 'dart:convert';

import 'user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final http.Client client;

  UserRepository({required this.client});

  Future<User> getUser() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
    throw Exception("Some Error occurred");
  }

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      return jsonList.map((e) => User.fromMap(e)).toList();
    } else {
      throw Exception("Failed to fetch users");
    }
  }
}

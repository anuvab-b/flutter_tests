import 'dart:convert';

class User{

  User();

  factory User.fromJson(String json){
    return User.fromMap(jsonDecode(json));
  }

  factory User.fromMap(Map<String,dynamic> map){
    return User();
  }
}
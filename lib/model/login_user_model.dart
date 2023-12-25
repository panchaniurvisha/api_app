// To parse this JSON data, do
//
//     final loginUserModel = loginUserModelFromJson(jsonString);

import 'dart:convert';

LoginUserModel loginUserModelFromJson(String str) =>
    LoginUserModel.fromJson(json.decode(str));

String loginUserModelToJson(LoginUserModel data) => json.encode(data.toJson());

class LoginUserModel {
  String? email;
  String? password;
  String? id;
  String? createdAt;

  LoginUserModel({
    this.email,
    this.password,
    this.id,
    this.createdAt,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) => LoginUserModel(
        email: json["email"],
        password: json["password"],
        id: json["id"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "id": id,
        "createdAt": createdAt,
      };
}

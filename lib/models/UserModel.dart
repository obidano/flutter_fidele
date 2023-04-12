// To parse this JSON data, do
//
//     final userModele = userModeleFromJson(jsonString);

import 'dart:convert';

UserModel userModeleFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModeleToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.username,
  });

  int? id;
  String? username;

  factory UserModel.fromJson(Map json) => UserModel(
    id: json["id"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
  };
}

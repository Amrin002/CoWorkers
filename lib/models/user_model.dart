// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? name;
  String? email;
  String? $id;
  String? $createdAt;
  String? $updateAt;

  UserModel({
     this.name,
     this.email,
     this.$id,
     this.$createdAt,
     this.$updateAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    email: json["email"],
    $id: json["\$id"],
    $createdAt: json["\$createdAt"],
    $updateAt: json["\$updateAt"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "\$id": $id,
    "\$createdAt": $createdAt,
    "\$updateAt": $updateAt,
  };
}
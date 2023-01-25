// To parse this JSON data, do
//
//     final usersData = usersDataFromJson(jsonString);

import 'dart:convert';

List<UsersData> usersDataFromJson(String str) =>
    List<UsersData>.from(json.decode(str).map((x) => UsersData.fromJson(x)));

String usersDataToJson(List<UsersData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersData {
  UsersData({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  DateTime? creationAt;
  DateTime? updatedAt;

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: json["role"],
        avatar: json["avatar"],
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "role": role,
        "avatar": avatar,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

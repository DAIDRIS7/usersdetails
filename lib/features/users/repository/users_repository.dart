import 'package:dio/dio.dart';
import 'package:usersdetails/features/users/model/users_model.dart';
import 'dart:convert';

class AllUserRepository {
  fetchAllUserData() async {
    final response = await Dio().get('https://api.escuelajs.co/api/v1/users');
    final List<UsersData> listOfAllUserData =
        List<UsersData>.from(response.data.map((e) {
      return UsersData.fromJson(e);
    })).toList();
    return listOfAllUserData;
  }
}

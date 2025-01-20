import 'package:bingo/model/user_model.dart';
import 'package:bingo/utils/routes/routes_name.dart';
import 'package:bingo/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(context) {
    getUserData().then((value) async {
      if (kDebugMode) {
        print(value.token);
      }
      if (value.token == 'null' || value.token == '' || value.token == null) {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error);
      }
    });
  }
}

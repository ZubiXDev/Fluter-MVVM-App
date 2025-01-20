import 'package:bingo/model/user_model.dart';
import 'package:bingo/repository/auth_repository.dart';
import 'package:bingo/utils/routes/routes_name.dart';
import 'package:bingo/utils/utils.dart';
import 'package:bingo/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loginLoading = false;
  bool get loading => _loginLoading;

  bool _signUpLoading = false;
  bool get signUploading => _signUpLoading;

  setLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);

      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(
        UserModel(
          token: value['token'].toString(),
        ),
      );

      Utils.flushbarMessage('Login Successfully', context, Colors.green,
          Icons.check_circle_sharp);

      Navigator.pushNamed(context, RoutesName.home);

      if (kDebugMode) {
        print(value);
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if (kDebugMode) {
        Utils.flushbarMessage(
            error.toString(), context, Colors.red, Icons.error_sharp);
        print(error);
      }
    });
  }

  Future<void> signUpApi(dynamic data, context) async {
    setSignUpLoading(true);
    _myRepo.loginApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushbarMessage('SignUp Successfully', context, Colors.green,
          Icons.check_circle_sharp);

      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value);
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);

      if (kDebugMode) {
        Utils.flushbarMessage(
            error.toString(), context, Colors.red, Icons.error_sharp);
        print(error);
      }
    });
  }
}

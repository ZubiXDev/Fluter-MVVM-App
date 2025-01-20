import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static String emailValidationCheck(String emailString) {
    String emailRegexPattern =
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
    RegExp emailRegex = RegExp(emailRegexPattern);

    if (emailString.trim().isEmpty) {
      return "Email Required";
    } else if (!emailRegex.hasMatch(emailString)) {
      return "Enter a Valid Email";
    }

    return "Email is Valid";
  }

  static String passwordValidationCheck(String passwordString) {
    String passwordRegexPattern =
        r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
    RegExp passwordRegex = RegExp(passwordRegexPattern);

    if (passwordString.trim().isEmpty) {
      return "Password Required";
    } else if (passwordString.length < 8) {
      return "Password must be at least 8 Characters long";
    }
    // else if (!passwordRegex.hasMatch(passwordString)) {
    //   return "Password must include an uppercase letter, lowercase letter, a number, and a special character";
    // }

    return "Password is Valid";
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static flushbarMessage(String message, BuildContext context,
      Color backgroundColor, IconData icon) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        titleColor: Colors.white,
        borderRadius: BorderRadius.circular(10),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(14),
        reverseAnimationCurve: Curves.easeOut,
        backgroundColor: backgroundColor,
        flushbarPosition: FlushbarPosition.BOTTOM,
        positionOffset: 20,
        // title: 'DUDE',
        message: message,
        duration: const Duration(seconds: 3),

        icon: Icon(
          icon,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static snackbarMessage(
      String message, context, Color backgroundColor, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.all(14),
      ),
    );
  }
}

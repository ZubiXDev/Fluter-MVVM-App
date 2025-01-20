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
      return "*Required";
    } else if (!emailRegex.hasMatch(emailString)) {
      return "Enter a Valid Email";
    }

    return "Email is Valid";
  }

  // static String passwordValidationCheck(String passwordString) {
  //   String passwordRegexPattern =
  //       r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$";
  //   RegExp passwordRegex = RegExp(passwordRegexPattern);

  //   if (passwordString.trim().isEmpty) {
  //     return "*Required";
  //   } else if (passwordString.length < 8) {
  //     return "Password Should be 8 Characters long";
  //   } else if (!passwordRegex.hasMatch(passwordString)) {
  //     return "Password include a letter, a number, and a special character";
  //   }

  //   return "Password is Valid";
  // }

  static String passwordValidationCheck(String passwordString) {
    // if (passwordString.length < 8) {
    // return 'Password must be at least 8 characters long';
    // } else if (!passwordString.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain at least one uppercase letter';
    // } else if (!passwordString.contains(RegExp(r'[a-z]'))) {
    //   return 'Password must contain at least one lowercase letter';
    // } else if (!passwordString.contains(RegExp(r'[0-9]'))) {
    //   return 'Password must contain at least one digit';
    // } else if (!passwordString.contains(RegExp(r'[^a-zA-Z0-9]'))) {
    //   return 'Password must contain at least one special character';
    // } else {
    return 'Password is valid';
    // }
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
}

import 'package:bingo/resources/colors.dart';
import 'package:bingo/resources/components/round_button.dart';
import 'package:bingo/utils/routes/routes_name.dart';
import 'package:bingo/utils/utils.dart';
import 'package:bingo/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final ValueNotifier<bool> _obscurePasswordNotifier =
      ValueNotifier<bool>(true);

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                hintText: 'till@gmail.com',
                label: Text('Email'),
                prefixIcon: Icon(
                  Icons.alternate_email,
                  color: AppColors.iconColor,
                ),
              ),
              onFieldSubmitted: (val) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            ValueListenableBuilder(
              valueListenable: _obscurePasswordNotifier,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePasswordNotifier.value,
                  obscuringCharacter: '*',
                  focusNode: passwordFocusNode,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    hintText: '********',
                    label: const Text('Password'),
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: AppColors.iconColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _obscurePasswordNotifier.value =
                            !_obscurePasswordNotifier.value;
                      },
                      icon: Icon(
                        _obscurePasswordNotifier.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height * 0.07),
            RoundButton(
              text: 'Login',
              loading: authViewModel.loading,
              onPress: () {
                if (_emailController.text.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(_emailController.text)) {
                  Utils.flushbarMessage('Enter a Valid Email', context,
                      Colors.red, Icons.error_sharp);
                } else {
                  String passwordValidationResult =
                      Utils.passwordValidationCheck(_passwordController.text);
                  if (passwordValidationResult != 'Password is valid') {
                    Utils.flushbarMessage(passwordValidationResult, context,
                        Colors.red, Icons.error_sharp);
                  } else {
                    // Map data = {
                    //   "email": _emailController.text,
                    //   "password": _passwordController.text
                    // };
                    Map data = {
                      "email": "eve.holt@reqres.in",
                      "password": "cityslicka"
                    };
                    authViewModel.loginApi(data, context);
                  }
                }
              },
            ),
            SizedBox(height: height * 0.02),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.signUp);
              },
              child: const Text("Don't have an Account. Sign Up!"),
            ),
          ],
        ),
      ),
    );
  }
}

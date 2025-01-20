import 'package:bingo/resources/colors.dart';
import 'package:bingo/resources/components/round_button.dart';
import 'package:bingo/utils/routes/routes_name.dart';
import 'package:bingo/utils/utils.dart';
import 'package:bingo/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _signUpEmailController = TextEditingController();
  final TextEditingController _signUpPasswordController =
      TextEditingController();

  final ValueNotifier<bool> _obscureSignUpPasswordNotifier =
      ValueNotifier<bool>(true);

  FocusNode signUpEmailFocusNode = FocusNode();
  FocusNode signUpPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _signUpEmailController.dispose();
    _signUpPasswordController.dispose();

    signUpEmailFocusNode.dispose();
    signUpPasswordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _signUpEmailController,
              focusNode: signUpEmailFocusNode,
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
                    context, signUpEmailFocusNode, signUpPasswordFocusNode);
              },
            ),
            SizedBox(
              height: height * 0.01,
            ),
            ValueListenableBuilder(
              valueListenable: _obscureSignUpPasswordNotifier,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return TextFormField(
                  controller: _signUpPasswordController,
                  obscureText: _obscureSignUpPasswordNotifier.value,
                  obscuringCharacter: '*',
                  focusNode: signUpPasswordFocusNode,
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
                        _obscureSignUpPasswordNotifier.value =
                            !_obscureSignUpPasswordNotifier.value;
                      },
                      icon: Icon(
                        _obscureSignUpPasswordNotifier.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * 0.07,
            ),
            RoundButton(
              text: 'Sign Up',
              loading: authViewModel.loading,
              onPress: () {
                if (_signUpEmailController.text.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(_signUpEmailController.text)) {
                  Utils.flushbarMessage('Enter a Valid Email', context,
                      Colors.red, Icons.error_sharp);
                } else {
                  String passwordValidationResult =
                      Utils.passwordValidationCheck(
                          _signUpPasswordController.text);
                  if (passwordValidationResult != 'Password is valid') {
                    Utils.flushbarMessage(passwordValidationResult, context,
                        Colors.red, Icons.error_sharp);
                  } else {
                    Map data = {
                      "email": _signUpEmailController.text,
                      "password": _signUpPasswordController.text
                    };
                    authViewModel.signUpApi(data, context);
                  }
                }
              },
            ),
            SizedBox(height: height * 0.02),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: const Text("Already have an Account. LogIn!"),
            ),
          ],
        ),
      ),
    );
  }
}

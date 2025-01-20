import 'package:bingo/resources/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final bool loading;

  const RoundButton({
    super.key,
    required this.text,
    required this.onPress,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(14)),
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: const TextStyle(color: AppColors.buttonTextColor),
                ),
        ),
      ),
    );
  }
}

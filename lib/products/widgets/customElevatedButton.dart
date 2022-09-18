import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressedFunc;
  final String buttonText;
  const CustomElevatedButton({
    Key? key,
    required this.onPressedFunc,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressedFunc,
        child: Text(
          buttonText,
        ),
      ),
    );
  }
}

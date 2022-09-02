import 'package:flutter/material.dart';
import 'package:movie_app/core/init/theme/color/color_theme.dart';


class CustomInputFeild extends StatefulWidget {
  String? hintText;
  IconData prefixIcon;
  IconData? SuffixIcon;

  CustomInputFeild({
    Key? key,
    this.hintText,
    required this.prefixIcon,
    this.SuffixIcon,
  }) : super(key: key);

  @override
  State<CustomInputFeild> createState() => _CustomInputFeildState();
}

class _CustomInputFeildState extends State<CustomInputFeild> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: visible ? true : false,
      style: TextStyle(
          color: AppColors().grey, fontSize: 18, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon),
        suffixIcon: widget.SuffixIcon != null
            ? GestureDetector(
                child: visible
                    ? const Icon(Icons.visibility_off)
                    : Icon(widget.SuffixIcon),
                onTap: () {
                  setState(() {
                    visible = !visible;
                  });
                },
              )
            : const SizedBox(),
        hintText: widget.hintText ?? '',
      ),
    );
  }
}

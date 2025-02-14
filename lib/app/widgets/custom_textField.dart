import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/color_values.dart';
import '../theme/styles.dart';

class LoginCustomTextfield extends GetView {
  String? ishint;
  bool obscureText;
  Widget? widget;
  TextEditingController? textController;
  String? errorController;
  Function(dynamic value)? onChanged;
  Function()? ontap;
  Function(dynamic value)? onfieldSubmitted;
  int? maxLine;
  bool enabled;

  LoginCustomTextfield(
      {Key? key,
      this.ishint,
      this.obscureText = false,
      this.textController,
      this.widget,
      this.errorController,
      this.onChanged,
      this.onfieldSubmitted,
      this.maxLine = 1,
      this.enabled = true,
      this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onFieldSubmitted: onfieldSubmitted,
      onTap: ontap,
      maxLines: maxLine,
      onChanged: onChanged,
      controller: textController,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: ColorValues.whiteColor,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: ColorValues.greyBorderColor,
            )),
        border: InputBorder.none,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: ColorValues.greyBorderColor,
            )),
        errorStyle: TextStyle(
          height: 0,
        ),
        errorText: errorController,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        suffixIcon: widget,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: ColorValues.greyBorderColor,
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: ColorValues.greyBorderColor,
            )),
        hintText: ishint,
        hintStyle: Styles.grey12,
      ),
    );
  }
}

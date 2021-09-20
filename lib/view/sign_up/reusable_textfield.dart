import 'package:chat_now/utils/colorscheme.dart';
import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/utils/text_style.dart';
import 'package:flutter/material.dart';


Container reusableTextField(
    {@required String? hint,
    Icon? icon,
    Widget? country,
    bool? obscureText,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    @required TextEditingController? controller}) {
  return Container(
    height: 50,
    margin: EdgeInsets.only(left: 5, right: 5),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
            color: const Color(0x1f3c679d),
            offset: Offset(0, 2),
            blurRadius: 5,
            spreadRadius: 1),
      ],
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      color: const Color(0xfff9fafc),
    ),
    child: Row(
      children: [
        Container(),
        country != null ? country : Container(),
        Flexible(
          child: TextField(
            textInputAction: textInputAction ?? TextInputAction.next,
            controller: controller,
            obscureText: obscureText ?? false,
            autocorrect: false,
            cursorColor: primaryColor,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: icon,
              contentPadding: EdgeInsets.only(left: 16.0, right: 16),
              /*suffixIcon: hint == 'Password:'
                  ? GestureDetector(onTap: () {

              }, child: Icon(Icons.visibility))
                  : null,*/

              hintText: hint,
              hintStyle: CommonStyle.getGibsonStyle(
                  color: CommonColors.gray78,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
              filled: true,
              fillColor: CommonColors.whiteColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

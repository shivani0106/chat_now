import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomButtonWithOpacity extends StatelessWidget {
  final Function? callback;
  final String? title;

  CustomButtonWithOpacity({this.callback, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback!();
      },
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title ?? "",
              style: CommonStyle.getGibsonStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: CommonColors.primaryColor),
            ),
            SizedBox(
              width: 15.0,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: LinearGradient(colors: [
                    CommonColors.primaryColor,
                    CommonColors.primaryColor.withOpacity(0.5)
                  ])),
              child: Icon(
                Icons.arrow_forward_outlined,
                color: CommonColors.whiteColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function? callback;
  final String? title;

  CustomButton({this.callback, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback!();
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CommonColors.greenColor),
        child: Center(
            child: Text(
          title ?? "",
          style: CommonStyle.getGibsonStyle(
              fontSize: 15, color: CommonColors.whiteColor),
        )),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final Function? callback;
  final String? title;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  PrimaryButton({this.callback, this.title, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback!();
      },
      child: Container(
        height: 50,
        padding: padding ?? EdgeInsets.all(0),
        margin: margin ?? EdgeInsets.all(0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CommonColors.primaryColor),
        child: Center(
            child: Text(
          title ?? "",
          style: CommonStyle.getGibsonStyle(
              fontSize: 15,
              color: CommonColors.whiteColor,
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}

class PrimaryOrangeButton extends StatelessWidget {
  final Function? callback;
  final String? title;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  PrimaryOrangeButton({this.callback, this.title, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback!();
      },
      child: Container(
        height: 50,
        padding: padding ?? EdgeInsets.all(0),
        margin: margin ?? EdgeInsets.all(0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CommonColors.primaryColor.withOpacity(0.8)),
        child: Center(
            child: Text(
          title ?? "",
          style: CommonStyle.getGibsonStyle(
              fontSize: 15,
              color: CommonColors.whiteColor,
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}

class DarkGreenButton extends StatelessWidget {
  final Function? callback;
  final String? title;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  DarkGreenButton({this.callback, this.title, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback!();
      },
      child: Container(
        height: 50,
        padding: padding ?? EdgeInsets.all(0),
        margin: margin ?? EdgeInsets.all(0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: CommonColors.darkGreen),
        child: Center(
            child: Text(
          title ?? "",
          style: CommonStyle.getGibsonStyle(
              fontSize: 15,
              color: CommonColors.whiteColor,
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  final Function? callback;
  final String? title;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  BlueButton(
      {this.callback,
      this.title,
      this.padding,
      this.margin,
      this.height,
      this.width,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback!();
      },
      child: Container(
        height: height ?? 50,
        width: width ?? double.infinity,
        padding: padding ?? EdgeInsets.all(0),
        margin: margin ?? EdgeInsets.all(0),
        decoration: BoxDecoration(
            borderRadius: borderRadius ?? BorderRadius.circular(10.0),
            color: CommonColors.blue14),
        child: Center(
            child: Text(
          title ?? "",
          style: CommonStyle.getGibsonStyle(
              fontSize: 15,
              color: CommonColors.whiteColor,
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}

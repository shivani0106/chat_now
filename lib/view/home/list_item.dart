import 'package:chat_now/models/user_master.dart';
import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/utils/text_style.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final UserMaster? allUser;
  ListItem({this.allUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10.0),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(50.0)),
              child: Center(
                child: Text(
                  allUser!.fullName.toString().characters.first.toUpperCase(),
                  style: CommonStyle.getGibsonStyle(
                      color: CommonColors.whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              allUser!.fullName.toString(),
              style: CommonStyle.getGibsonStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: CommonColors.black23),
            ),
          )
        ],
      ),
    );
  }
}

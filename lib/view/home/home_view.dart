import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/utils/text_style.dart';
import 'package:chat_now/view/home/home_view_model.dart';
import 'package:chat_now/view/home/list_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  final User? user;

  HomeView({this.user});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel? mViewModel;

  @override
  void initState() {
    mViewModel = Provider.of<HomeViewModel>(context, listen: false);
    mViewModel!.attachContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mViewModel = Provider.of<HomeViewModel>(context);

    if (mViewModel!.myData == null) {
      return Scaffold(
        body: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(CommonColors.primaryColor),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("ChatNow"),
        backgroundColor: CommonColors.primaryColor,
        elevation: 1,
        actions: [
          Container(
            margin: EdgeInsets.all(10.0),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(50.0)),
            child: Center(
              child: Text(
                mViewModel!.myData!.fullName.toString().characters.first,
                style: CommonStyle.getGibsonStyle(
                    color: CommonColors.whiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mViewModel!.userList.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: mViewModel!.userList.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                        allUser: mViewModel!.userList[index],
                      );
                    })
                : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

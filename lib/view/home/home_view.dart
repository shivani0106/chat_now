import 'package:chat_now/utils/common_colors.dart';
import 'package:chat_now/view/home/home_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("ChatNow"),
        backgroundColor: CommonColors.primaryColor,
        elevation: 1,
      ),
      body: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            mViewModel!.userList.length > 0
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: mViewModel!.userList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(children: [
                          Container(
                            child: Text(mViewModel!.userList[index].fullName
                                .toString()),
                          ),
                        ]),
                      );
                    })
                : CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}

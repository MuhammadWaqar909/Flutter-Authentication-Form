import 'package:authentication_app_login/pages/LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      SizedBox(
        height: 20,
      ),
      Text("Email : Waqarkhan@gmail.com"),
      TextButton(
          onPressed: (() => Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(pageBuilder: (context, a, b) => LoginPage()),
              (route) => false)),
          child: Text("Verify Email")),
    ]));
  }
}

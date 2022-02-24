import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        key: _formkey,
        child: Column(children: [
          SizedBox(
            height: 25,
          ),
          TextFormField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Change Password"),
                  hintText: "Enter new Password")),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Change Password"))
        ]),
      ),
    );
  }
}

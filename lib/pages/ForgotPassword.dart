import 'package:authentication_app_login/pages/LoginPage.dart';
import 'package:authentication_app_login/pages/SignUp.dart';
import 'package:authentication_app_login/routes/Routes.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    // late FocusNode myFocusNode;

    // @override
    // void initState() {
    //   super.initState();

    //   myFocusNode = FocusNode();
    // }

    // @override
    // void dispose() {
    //   // Clean up the focus node when the Form is disposed.
    //   myFocusNode.dispose();

    //   super.dispose();
    // }

    final _formkey = GlobalKey<FormState>();

    // ignore: unused_local_variable
    var email = "";
    // ignore: unused_local_variable

    final emailController = TextEditingController();

    @override
    // ignore: unused_element
    void dispose() {
      emailController.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Change Password"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 25),
            child: Form(
                key: _formkey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      child: Text(
                        "Reset Link will be send on your email id !",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(20),
                      child: Material(
                        child: TextFormField(
                          textInputAction: TextInputAction.go,
                          controller: emailController,
                          decoration: const InputDecoration(
                              errorStyle:
                                  TextStyle(color: Colors.red, fontSize: 15),
                              border: OutlineInputBorder(),
                              hintText: "Enter Your Email",
                              label: Text("Email")),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Valid Email";
                            } else if (!value.contains("@")) {
                              return " You are missing @";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text("Send Email"),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                email = emailController.text;
                              });
                            }
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                      pageBuilder: (context, a, b) =>
                                          LoginPage()),
                                  (route) => false);
                            },
                            child: const Text("Login"))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                      transitionDuration: Duration(seconds: 0),
                                      pageBuilder: (context, a, b) =>
                                          SignUpPage()),
                                  (route) => false);
                            },
                            child: const Text("Dont have an account?")),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 0),
                                    pageBuilder: (context, a, b) =>
                                        SignUpPage()),
                                (route) => false);
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[800]),
                          ),
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

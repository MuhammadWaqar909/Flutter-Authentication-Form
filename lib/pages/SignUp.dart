// ignore_for_file: file_names

import 'package:authentication_app_login/routes/Routes.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
    var password = "";
    // ignore: unused_local_variable
    var confirmPassword = "";

    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    @override
    // ignore: unused_element
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      confirmPasswordController.dispose();
    }

    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Flutter SignUp"),
        ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 30),
                Center(
                  child: Text(
                    "Sign Up Form",
                    style: TextStyle(
                        fontSize: 30,
                        // ignore: prefer_const_literals_to_create_immutables
                        shadows: <Shadow>[
                          const Shadow(
                            offset: Offset(3.0, 3.0),
                            blurRadius: 3.0,
                            color: Color.fromARGB(117, 122, 107, 107),
                          )
                        ],
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800]),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Material(
                    child: TextFormField(
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      textInputAction: TextInputAction.go,
                      controller: emailController,
                      decoration: const InputDecoration(
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
                Container(
                  margin: const EdgeInsets.all(18),
                  child: Material(
                    child: TextFormField(
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Your Password",
                          label: Text("Password")),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(18),
                  child: Material(
                    child: TextFormField(
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      textInputAction: TextInputAction.done,
                      obscureText: true,
                      controller: confirmPasswordController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Confirm Your Password",
                          label: Text("Confirm Password")),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Text("Sign Up"),
                      onPressed: () {
                        setState(() {
                          email = emailController.text;
                          password = passwordController.text;
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, a, b) =>
                                        LoginPage()),
                                (route) => false);
                          });
                        },
                        child: const Text("Already have an account?")),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (context, a, b) => LoginPage()),
                              (route) => false);
                        });
                      },
                      child: const Text(
                        "Login",
                        style:
                            TextStyle(color: Color.fromARGB(255, 80, 79, 79)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

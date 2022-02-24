import 'package:authentication_app_login/pages/ForgotPassword.dart';
import 'package:authentication_app_login/pages/SignUp.dart';
import 'package:authentication_app_login/pages/userMain.dart';
import 'package:authentication_app_login/routes/Routes.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    userLogin() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const UserMain()));
    }

    @override
    // ignore: unused_element
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Authertication"),
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
                    Center(
                      child: Text(
                        "Login Form",
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
                    Container(
                      margin: const EdgeInsets.all(18),
                      child: Material(
                        child: TextFormField(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text("Login"),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                email = emailController.text;
                                password = passwordController.text;
                              });
                              userLogin();
                            }
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()));
                            },
                            child: const Text("Forgot password?"))
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

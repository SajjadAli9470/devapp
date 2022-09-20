// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:techstore/utils/routes.dart';
import 'package:techstore/widgets/themes.dart';
import 'package:flutter/material.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  // const SignPage({Key? key}) : super(key: key);

  String name = "";
  String password = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return "Enter valid Email";
    } else
      return null;
  }

  movetoHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.loginRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Random random = new Random();
    int randomNu = random.nextInt(100);
    return SafeArea(
      child: Material(
        color: Theme.of(context).cardColor,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              // Box decoration takes a gradient
              gradient: LinearGradient(
                // Where the linear gradient begins and ends
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: const [0.1, 0.5, 0.7, 0.9],
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.blue.withOpacity(0.7),
                  Colors.deepPurple.withOpacity(0.7),
                  Colors.blue.withOpacity(0.7),
                  Colors.purple.withOpacity(0.6),
                ],
              ),
            ),
            child: Form(
              key: _formKey,
              // ignore: duplicate_ignore
              child: Column(children: [
                Image.asset(
                  "assets/images/sign_img.png",
                  fit: BoxFit.cover,
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter first name",
                              labelText: "First name"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = "$value$randomNu";

                            setState(() {});
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter  last name",
                              labelText: "last name"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: TextEditingController(text: "$name"),
                          decoration: const InputDecoration(
                            hintText: "Enter username",
                            labelText: "Username",
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter Email", labelText: "Email"),
                          validator: (value) {
                            String pattern =
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$";
                            RegExp regex = RegExp(pattern);
                            if (value == null ||
                                value.isEmpty ||
                                !regex.hasMatch(value)) {
                              return 'Enter a valid email address';
                            } else {
                              return null;
                            }
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Enter password",
                              labelText: "Password"),
                          onChanged: (value) {
                            password = value;
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else {
                              if (value.length < 6) {
                                return "Password length should be atleast 6 ";
                              }
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              hintText: "Enter password",
                              labelText: "Password"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            } else {
                              if (value.length < 6) {
                                return "Password length should be atleast 6 ";
                              } else {
                                if (value != password) {
                                  return "Confirm your password ";
                                }
                              }
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        InkWell(
                          onTap: () => {movetoHome(context)},
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: MyTheme.lightBluishColor,
                              shape: changeButton
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                              // borderRadius: BorderRadius.circular(50)),
                            ),
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

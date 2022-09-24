// ignore_for_file: prefer_const_constructors

import 'package:techstore/utils/routes.dart';
import 'package:techstore/widgets/themes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // const LoginPage({Key? key}) : super(key: key);
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();
  movetoHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                stops: const [0.1, 0.4, 0.7, 0.9],
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
                  // Colors are easy thanks to Flutter's Colors class.
                  Colors.blue.withOpacity(0.7),
                  Colors.deepPurple.withOpacity(0.6),
                  Colors.blue.withOpacity(0.7),
                  Colors.purple.withOpacity(0.3),
                ],
              ),
            ),
            child: Form(
              key: _formKey,
              child: Column(children: [
                Image.asset(
                  "assets/images/login_img.png",
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
                        Text(
                          "Welcome",
                          // ignore: unnecessary_const
                          style: const TextStyle(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Enter username",
                              labelText: "Username"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
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
                              }
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              // Where the linear gradient begins and ends
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              // Add one stop for each color. Stops should increase from 0 to 1
                              stops: const [0.1, 0.4, 0.7, 0.9],
                              // ignore: prefer_const_literals_to_create_immutables
                              colors: [
                                // Colors are easy thanks to Flutter's Colors class.
                                Colors.blue.withOpacity(0.7),
                                Colors.deepPurple.withOpacity(0.6),
                                Colors.blue.withOpacity(0.7),
                                Colors.purple.withOpacity(0.3),
                              ],
                            ),
                            // color: Color.fromARGB(255, 31, 3, 29),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          width: 170,
                          height: 50,
                          child: MaterialButton(
                            onPressed: () {
                              movetoHome(context);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 13, 32, 65),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Text("@copyright 2022 TechStore")
                        // InkWell(
                        //   onTap: () => {movetoHome(context)},
                        //   child: AnimatedContainer(
                        //     duration: Duration(seconds: 1),
                        //     width: changeButton ? 50 : 150,
                        //     height: 50,
                        //     alignment: Alignment.center,
                        //     child: changeButton
                        //         ? Icon(
                        //             Icons.done,
                        //             color: Colors.white,
                        //           )
                        //         : Text(
                        //             "Login",
                        //             style: TextStyle(
                        //                 color: Colors.white,
                        //                 fontWeight: FontWeight.bold,
                        //                 fontSize: 18),
                        //           ),
                        //     decoration: BoxDecoration(
                        //       color: MyTheme.lightBluishColor,
                        //       shape: changeButton
                        //           ? BoxShape.circle
                        //           : BoxShape.rectangle,
                        //       // borderRadius: BorderRadius.circular(50)),
                        //     ),
                        //   ),
                        // ),
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

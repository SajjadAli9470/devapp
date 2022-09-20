// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:techstore/pages/cart_page.dart';
import 'package:techstore/pages/home_page.dart';
import 'package:techstore/pages/login_page.dart';
import 'package:techstore/pages/signup_page.dart';
import 'package:techstore/utils/routes.dart';
import 'package:techstore/widgets/themes.dart';
// ignore: depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart';
import 'core/store.dart';

// void main() {
//   runApp(
//     MyApp(),
//   );
// }

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  // String for any word
  // double for float
  // int for integer
  // num for int and double
  // var for any data type
  // const for constant value

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: HomePage(),
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.SignRoute,
      routes: {
        // "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => cartPage(),
        MyRoutes.SignRoute: (context) => SignPage(),
      },
    );
  }
}

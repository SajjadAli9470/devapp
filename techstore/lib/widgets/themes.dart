import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: darkBluishColor),
        brightness: Brightness.light,
        cardColor: creamcolor,
        canvasColor: Colors.white,
        buttonColor: darkBluishColor,
        accentColor: Colors.black,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
      );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.grey).copyWith(
          secondary: Colors.white,
          brightness: Brightness.dark,
        ),
        cardColor: darkBluishColor,
        canvasColor: Colors.black,
        buttonColor: lightBluishColor,
        accentColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
        // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
        //     .copyWith(secondary: Colors.white),
      );

  static Color creamcolor = const Color(0xfff5f5f5);
  static Color darkcreamcolor = const Color.fromARGB(255, 93, 114, 206);
  static Color darkBluishColor = const Color.fromARGB(255, 38, 35, 49);
  static Color lightBluishColor = const Color.fromARGB(255, 109, 127, 207);
}

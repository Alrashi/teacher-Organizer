import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teacher Organizer',
      theme: ThemeData(
        textTheme: GoogleFonts.abelTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.red,
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

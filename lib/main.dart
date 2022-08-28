import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'screens/homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(
                  "You have an Error! In Snapshot 11 ${snapshot.error.toString()}");
              return const Text("Something went wrong 11");
            } else if (snapshot.hasData) {
              return HomePage();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )

        //HomePage(),
        );
  }
}

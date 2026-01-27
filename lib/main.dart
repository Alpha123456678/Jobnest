import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobnest/Login/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("Initializing App...",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Signatra'
                ),),
              ),
            ),
          );
        }

        else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text("An error occurred",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ) 
          );
        }

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'JobNest',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            primarySwatch: Colors.blue,
          ),
          home: Login(),
        );
      },
    );
  }
}


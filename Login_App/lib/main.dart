  import 'package:flutter/material.dart';
import 'package:login_app/screens/first_screen.dart';
import 'package:login_app/screens/second_screen.dart';
import 'package:firebase_core/firebase_core.dart';
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login_Page",
      home: IntroScreen(),
      routes: {
        'intro': (context) => IntroScreen(),
        'home': (context) => HomeScreen(),
       // 'login': (context) => AuthScreen(authType: AuthType.login),
       // 'register': (context) => AuthScreen(authType: AuthType.register),
      },
    );
  }
}

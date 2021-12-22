import 'package:flutter/material.dart';
import 'package:selection_test/screens/onboarding/login_screen.dart';
import 'package:selection_test/screens/onboarding/splash_screen.dart';
import 'package:selection_test/screens/home_screen.dart';
import 'package:selection_test/screens/view_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: LoginScreen(),
    );
  }
}

//ViewDetailsScreen
// HomeScreen(),
// LoginScreen(),
// SplashScreen(),

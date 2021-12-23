import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:selection_test/screens/onboarding/login_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:selection_test/screens/onboarding/splash_screen.dart';

// void main() => runApp(MyApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

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
      home: SplashScreen(),
    );
  }
}

//ViewDetailsScreen
// HomeScreen(),
// LoginScreen(),
// SplashScreen(),

import 'package:flutter/material.dart';
import 'package:selection_test/screens/home_screen.dart';
import 'package:selection_test/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animator/flutter_animator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.aBeeZeeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            color: DefaultColor,
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Pulse(
                  preferences: AnimationPreferences(
                      offset: Duration(seconds: 1),
                      autoPlay: AnimationPlayStates.Loop),
                  child: Container(
                      alignment: const Alignment(0.0, 0.0),
                      child: Text("Selection Test",
                          textAlign: TextAlign.center, style: SplashLogoText)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

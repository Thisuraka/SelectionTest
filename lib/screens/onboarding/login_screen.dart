import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:selection_test/styles.dart';
import 'package:selection_test/widgets/custom_appbar.dart';
import 'package:selection_test/widgets/custom_button.dart';

import '../home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loaded = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signin() async {
    setState(() {
      _loaded = false;
    });
    try {
      final facebookLoginResult = await FacebookAuth.instance.login();
      final userData = await FacebookAuth.instance.getUserData();

      final facebookAuthCredential = FacebookAuthProvider.credential(
          facebookLoginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      await FirebaseFirestore.instance.collection('users').add({
        'email': userData['email'],
        'imageUrl': userData['picture']['data']['url'],
        'name': userData['name'],
      });

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      var title = '';
      switch (e.code) {
        case 'account-exists-with-different-credentials':
          title = "This account exists with a different sign in provider";
          break;
        case 'invalid-credential':
          title = "Invalid Credentials detetced";
          break;
        case 'operation-not-allowed':
          title = "This operation is not allowed";
          break;
        case 'user-disabled':
          title = "The user you tried to login to is disabled";
          break;
        case 'user-not-found':
          title = "The user you tried to login to was not found";
          break;
      }

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Login with Facebook failed'),
                content: Text(title),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('OK'))
                ],
              ));
    } finally {
      setState(() {
        _loaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loaded = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomAppbarWidget(
          mainTitle: "Login",
          leadingImg: true,
          logo: true,
          searchIcon: false,
        ),
      ),
      body: _loaded
          ? GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 110, top: 100),
                          child: Text("Login",
                              style: TextStyle(
                                  fontFamily: DefaultFont,
                                  color: DefaultColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40.0)),
                        ),
                        Container(
                          height: 510,
                          margin: EdgeInsets.only(top: 300),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: CustomButton(
                                    text: "Continue without logging in",
                                    width: 330.0,
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                  child: Text(
                                    "Terms and Conditions",
                                    style: TextButtonStyle,
                                  ),
                                  onTap: () {},
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                GestureDetector(
                                  child: Container(
                                    width: 200,
                                    child: Image.asset(
                                      'assets/images/signfb.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  onTap: () {
                                    _signin();
                                    Fluttertoast.showToast(
                                      msg: "Loading...",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : SpinKitFoldingCube(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? DefaultColor : InactiveColor,
                  ),
                );
              },
            ),
    );
  }
}
// w5G662mc4o81BUzLaFO2xjZlnHw
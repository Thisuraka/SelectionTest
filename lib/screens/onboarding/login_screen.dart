import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:selection_test/api/api_calls.dart';
import 'package:selection_test/styles.dart';
import 'package:selection_test/utils/settings.dart';
import 'package:selection_test/utils/validate.dart';
import 'package:selection_test/widgets/custom_appbar.dart';
import 'package:selection_test/widgets/custom_button.dart';
import 'package:selection_test/widgets/custom_button2.dart';
import 'package:selection_test/widgets/custom_textbox.dart';

import '../home_screen.dart';

@override
void initState() {}

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailAddress = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _loaded = true;
  @override
  Widget build(BuildContext context) {
    void _signin() async {
      if (_formKey.currentState!.validate()) {}
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomAppbarWidget(
          mainTitle: "Login",
          leadingImg: false,
          logo: false,
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
                          padding: EdgeInsets.only(left: 20, top: 30),
                          child: Text("selection_test",
                              style: TextStyle(
                                  fontFamily: DefaultFont,
                                  color: DefaultColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 40.0)),
                        ),
                        Container(
                          height: 510,
                          margin: EdgeInsets.only(top: 150),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextBox(
                                  controller: _emailAddress,
                                  hint: "Email address",
                                  labelText: 'Email address',
                                  prifixIcon: 'assets/icons/email.png',
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (_emailAddress) {
                                    if (_emailAddress.isEmpty) {
                                      return "Please enter your email address";
                                    }
                                    Validate().validateEmail(_emailAddress);
                                  },
                                ),
                                CustomTextBox(
                                  controller: _password,
                                  hint: "Password",
                                  labelText: 'Password',
                                  prifixIcon: 'assets/icons/lock.png',
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  validator: (_password) {
                                    if (_password.isEmpty) {
                                      return "Please enter your password";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  child: CustomButton(
                                    text: "Login",
                                    width: 330.0,
                                  ),
                                  onTap: () {
                                    _signin();
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
                                  child: Image.asset(
                                      'assets/images/signGoogle.png'),
                                  onTap: () {
                                    Fluttertoast.showToast(
                                      msg: "Coming soon...",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
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

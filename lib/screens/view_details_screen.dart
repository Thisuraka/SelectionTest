import 'package:flutter/material.dart';
import 'package:selection_test/api/api_calls.dart';
import 'package:selection_test/widgets/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animator/flutter_animator.dart';

class ViewDetailsScreen extends StatefulWidget {
  @override
  _ViewDetailsScreenState createState() => _ViewDetailsScreenState();

  String countryName = "";
  String code = "";
  String image = "";
  ViewDetailsScreen(
      {required this.countryName, required this.code, required this.image});
}

class _ViewDetailsScreenState extends State<ViewDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child: CustomAppbarWidget(
          mainTitle: "",
          leadingImg: false,
          logo: true,
          searchIcon: false,
        ),
      ),
      body: GestureDetector(
        onTap: () => {FocusScope.of(context).unfocus()},
        child: Container(
          height: double.infinity,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              FadeInDown(
                preferences:
                    AnimationPreferences(duration: Duration(seconds: 2)),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: SvgPicture.network(
                    widget.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.only(top: 270),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 50),
                      child: Center(
                        child: Text(
                          widget.code,
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      child: Center(
                        child: Text(
                          widget.countryName,
                          maxLines: 5,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 30.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

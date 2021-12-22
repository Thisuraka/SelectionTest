import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:selection_test/api/api_calls.dart';
import 'package:selection_test/utils/settings.dart';
import 'package:selection_test/styles.dart';
import 'package:selection_test/widgets/bigger_vertical_card.dart';
import 'package:selection_test/widgets/custom_appbar.dart';
import 'package:selection_test/widgets/custom_bottomNavBar.dart';
import 'package:selection_test/widgets/vertical_card.dart';

@override
void initState() {}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? country = "";
  String? countryCode = "";
  String? regionName = "";
  String? city = "";
  String? zip = "";

  bool _loaded = false;

  void locationGetter() async {
    final response = await ApiCalls.geoLocation();
    if (response.isSuccess) {
      var json = response.jsonBody;
      country = json['country'];
      countryCode = json['countryCode'];
      regionName = json['regionName'];
      city = json['city'];
      zip = json['zip'];
    }

    setState(() {});
    _loaded = true;
  }

  @override
  void initState() {
    locationGetter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(55),
            child: CustomAppbarWidget(
              mainTitle: "Home",
              leadingImg: true,
              logo: true,
              searchIcon: true,
            ),
          ),
          bottomNavigationBar: BottomNavbar(),
          body: _loaded
              ? Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  child: BigVerticalCard(
                    city: city!,
                    countryCode: countryCode!,
                    regionName: regionName!,
                    country: country!,
                    zip: zip!,
                  ))
              : SpinKitFoldingCube(
                  duration: Duration(seconds: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? DefaultColor : InactiveColor,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

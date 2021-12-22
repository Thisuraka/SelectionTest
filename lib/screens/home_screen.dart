import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:selection_test/api/api_calls.dart';
import 'package:selection_test/screens/view_details_screen.dart';
import 'package:selection_test/styles.dart';
import 'package:selection_test/widgets/bigger_horizontal_card.dart';
import 'package:selection_test/widgets/custom_appbar.dart';
import 'package:selection_test/widgets/horizontal_card.dart';

@override
void initState() {}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> listData = [];
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
    // _loaded = true;
  }

  void listDataGetter() async {
    final response = await ApiCalls.taskTwoGet();
    listData = response.jsonBody;

    setState(() {});

    _loaded = true;
  }

  @override
  void initState() {
    locationGetter();
    listDataGetter();
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
          body: _loaded
              ? Container(
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: MediaQuery.of(context).size.width,
                        child: BigHorizontalCard(
                          city: city!,
                          countryCode: countryCode!,
                          regionName: regionName!,
                          country: country!,
                          zip: zip!,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        margin: EdgeInsets.only(
                          top: 240,
                          left: 15,
                          right: 10,
                        ),
                        child: RefreshIndicator(
                          onRefresh: _pullRefresh,
                          child: listData.isNotEmpty
                              ? GridView.count(
                                  padding: EdgeInsets.all(0),
                                  scrollDirection: Axis.vertical,
                                  childAspectRatio: (100 / 30),
                                  crossAxisCount: 1,
                                  children: listData.map((data) {
                                    return GestureDetector(
                                      onTap: () => {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ViewDetailsScreen(
                                                    countryName: data["name"],
                                                    image: data["image"],
                                                    code: data["code"]),
                                          ),
                                        )
                                      },
                                      child: HorizontalCard(
                                        img: (data["image"].length > 0)
                                            ? data["image"]
                                            : '',
                                        name: (data["name"] != null)
                                            ? data["name"]
                                            : "Name Not Found",
                                        onChange: (value) {
                                          if (value) {
                                            _pullRefresh();
                                          }
                                        },
                                      ),
                                    );
                                  }).toList(),
                                )
                              : Center(child: Text("No vehicles to show")),
                        ),
                      ),
                    ],
                  ),
                )
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

  Future<void> _pullRefresh() async {
    setState(() {});
  }
}

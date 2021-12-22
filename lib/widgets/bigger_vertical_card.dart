import 'package:selection_test/api/api_calls.dart';

import '../../styles.dart';
import 'package:flutter/material.dart';

class BigVerticalCard extends StatelessWidget {
  String country;
  String countryCode;
  String regionName;
  String city;
  String zip;

  BigVerticalCard({
    required this.country,
    required this.countryCode,
    required this.regionName,
    required this.city,
    required this.zip,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 370,
          height: 220,
          margin: EdgeInsets.only(left: 15, right: 10, top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Button2BorderColor),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Stack(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                margin: EdgeInsets.only(left: 20, top: 20, right: 10),
                child: Center(
                  child: Text(
                    country,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 40,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 5.0, color: Colors.lightBlue.shade900),
                  ),
                ),
              ),
              Container(
                height: 110,
                width: 60,
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 33, left: 13),
                  child: Text(
                    countryCode,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 30,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        width: 5.0, color: Colors.lightBlue.shade500),
                    bottom: BorderSide(
                        width: 5.0, color: Colors.lightBlue.shade900),
                  ),
                ),
              ),
              Container(
                height: 45,
                width: double.infinity,
                margin: EdgeInsets.only(top: 130, left: 10, right: 10),
                child: Center(
                  child: Text(
                    city + "  -  " + regionName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                height: 45,
                width: double.infinity,
                margin: EdgeInsets.only(top: 170, left: 10, right: 10),
                child: Center(
                  child: Text(
                    zip,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

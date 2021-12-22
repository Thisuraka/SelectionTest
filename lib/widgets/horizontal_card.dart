import 'package:selection_test/api/api_calls.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../styles.dart';
import 'package:flutter/material.dart';

class HorizontalCard extends StatefulWidget {
  _HorizontalCardState createState() => _HorizontalCardState();
  String img;
  String name;

  final void Function(bool) onChange;

  HorizontalCard({
    required this.img,
    required this.name,
    required this.onChange,
  });
}

class _HorizontalCardState extends State<HorizontalCard> {
  String _token = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.only(top: 20, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Button2BorderColor),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 100,
            child: ClipRRect(
              child: SvgPicture.network(
                widget.img,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            width: 190,
            margin: EdgeInsets.only(top: 30, left: 120),
            child: Text(
              widget.name,
              style: TextStyle(
                  fontFamily: DefaultFont, color: Colors.black, fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}

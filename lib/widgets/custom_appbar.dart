import 'package:flutter/material.dart';
import '../../styles.dart';

class CustomAppbarWidget extends StatefulWidget {
  String mainTitle = "selection_test";
  bool leadingImg;
  bool logo;
  bool searchIcon;
  GlobalKey<ScaffoldState>? drawerKey = GlobalKey();

  CustomAppbarWidget(
      {required this.mainTitle,
      required this.leadingImg,
      required this.logo,
      required this.searchIcon,
      this.drawerKey});

  @override
  _CustomAppbarWidgetState createState() => new _CustomAppbarWidgetState();
}

class _CustomAppbarWidgetState extends State<CustomAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: widget.leadingImg
          ? Container(
              width: 15,
            )
          : GestureDetector(
              onTap: () => {Navigator.of(context).pop()},
              child: Image.asset('assets/icons/arrow-left.png')),
      title: widget.logo
          ? Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Text("Selection Test", style: LogoText),
            )
          : Text(
              widget.mainTitle,
              style: HeaderStyle,
            ),
    );
  }
}

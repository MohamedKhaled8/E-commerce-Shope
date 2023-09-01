import 'package:flutter/material.dart';


// ignore: must_be_immutable
class CustomButtomLocal extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double width;
  final Function()? onTap;
 double? fontSize;
  CustomButtomLocal({
    Key? key,
    required this.text,
    required this.color,
    required this.height,
    required this.width,
    this.onTap,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color:color , borderRadius: BorderRadius.circular(18)),
        child: Center(
          child: Text(
            text,
            style:  TextStyle(color: Colors.white, fontSize: fontSize ),
          ),
        ),
      ),
    );
  }
}

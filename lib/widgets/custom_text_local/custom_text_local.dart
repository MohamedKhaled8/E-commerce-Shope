import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

// ignore: must_be_immutable
class CustomTextLocal extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
   TextDecoration? underLine;
  final Function()? onTap;

   CustomTextLocal({
    Key? key,
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
     this.underLine,
    this.onTap,
    this.overflow,
    this.maxLines,
  }) : super(key: key);
TextOverflow? overflow;
int? maxLines;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Text(
        
        text,
        maxLines: maxLines,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            
            overflow: overflow,
            decoration: underLine,
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}

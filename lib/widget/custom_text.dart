import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;

  const CustomText({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.color = Colors.black87,
    this.fontSize = 15,
    this.textDecoration,
    this.textAlign = TextAlign.left,
    this.maxLines = 4,
    this.textOverflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: TextStyle(
        fontFamily: 'SF Pro', // Bắt buộc sử dụng font SF Pro
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }
}

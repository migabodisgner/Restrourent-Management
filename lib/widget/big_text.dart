// lib/widget/big_text.dart
// ignore_for_file: duplicate_import, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;

  const BigText({
    Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size = 0,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

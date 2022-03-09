import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';


Widget CustomText({
  String? text,
  double? fontSize,
  FontWeight? fontWeight,
  Color? color = Colors.black,
  TextAlign? position,
}) {
  return Text(
    '$text',
    style: TextStyle(
      color: color,
      fontSize: getProportionateScreenWidth(
        fontSize!,
      ),
      fontWeight: fontWeight,
    ),
    textAlign: position,
  );
}

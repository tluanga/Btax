import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:flutter/material.dart';

Widget authButton(String text,
    {double width = double.infinity, double height = 40}) {
  return SizedBox(
    height: 40,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.grey.shade600,
        ),
        borderRadius: BorderRadius.circular(4),
        //color: Colors.purple,
      ),
      height: 50,
      width: width,
      child: Center(
        child: Text(text,
            style: primaryTextStyle(weight: FontWeight.w600, size: 18)),
      ),
    ),
  );
}

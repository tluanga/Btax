import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:flutter/material.dart';

Widget userProfileText(String text, String label) {
  return Padding(
    padding: const EdgeInsets.only(top: 14),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label + ' :', style: primaryTextStyle(weight: FontWeight.w400)),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Text(text, style: primaryTextStyle()),
        ),
      ],
    ),
  );
}

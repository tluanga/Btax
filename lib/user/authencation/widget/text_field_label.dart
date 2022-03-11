import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:flutter/material.dart';

Widget textFieldLabel(
  String labelText,
) {
  return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2),
      width: double.infinity,
      child: Text(
        '',
        style: boldTextStyle(),
      ));
}

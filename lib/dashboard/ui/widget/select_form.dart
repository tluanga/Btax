import 'package:flutter/material.dart';

import '../../../common/widget_properties/textStyle.dart';

Widget selectForm() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.teal.shade400,
            // border: Border.all(
            //   color: Colors.grey.shade600,
            //   width: 1,
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Simple BAS Lodgement Form',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(size: 18, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(width: 14),
      Expanded(
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.teal.shade400,
            // border: Border.all(
            //   color: Colors.grey.shade600,
            //   width: 1,
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'More Forms',
                    style: primaryTextStyle(size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

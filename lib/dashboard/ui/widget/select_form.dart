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
            color: Colors.grey[100],
            border: Border.all(
              color: Colors.grey.shade600,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Simple BAS Lodgement Form',
                  style: primaryTextStyle(size: 18),
                ),
                const SizedBox(height: 6),
                Text(
                  '',
                  style: primaryTextStyle(size: 14),
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
            color: Colors.grey[100],
            border: Border.all(
              color: Colors.grey.shade600,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'More Forms',
                  style: primaryTextStyle(size: 16),
                ),
                const SizedBox(height: 6),
                Text(
                  '',
                  style: primaryTextStyle(size: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

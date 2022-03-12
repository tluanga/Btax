import 'package:flutter/material.dart';

import '../../../common/widget_properties/textStyle.dart';

Widget selectForm() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0.2,
          color: Colors.white,
          child: SizedBox(
            height: 120,
            // decoration: BoxDecoration(
            //     // borderRadius: BorderRadius.circular(4),
            //     //  color: Colors.teal.shade400,
            //     // border: Border.all(
            //     //   color: Colors.grey.shade600,
            //     //   width: 1,
            //     // ),
            //     ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Simple BAS Lodgement Form',
                    textAlign: TextAlign.center,
                    style: boldTextStyle(size: 16, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      const SizedBox(width: 14),
      Expanded(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0.2,
          color: Colors.white,
          child: SizedBox(
            height: 120,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(4),
            //   color: Colors.teal.shade400,
            //   // border: Border.all(
            //   //   color: Colors.grey.shade600,
            //   //   width: 1,
            //   // ),
            // ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'More Forms',
                      style:
                          boldTextStyle(size: 16, color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

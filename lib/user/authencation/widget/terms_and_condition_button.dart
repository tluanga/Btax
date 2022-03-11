import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:flutter/material.dart';

class TermsAndConditonButton extends StatelessWidget {
  const TermsAndConditonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'By signing up, you agree with the ',
              style: secondaryTextStyle(),
            ),
            Text(
              'Terms of',
              style: secondaryTextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Service',
              style: secondaryTextStyle(color: Colors.blue),
            ),
            Text(
              ' and ',
              style: secondaryTextStyle(),
            ),
            Text(
              'Privacy Policy',
              style: secondaryTextStyle(color: Colors.blue),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:btax/common/widget_properties/input_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textFormField(String label, TextEditingController controller,
    {bool isInt = false}) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: TextFormField(
      // key: _formKey,
      controller: controller,
      // onChanged: (value) {
      //   controller.text = value;
      // },

      keyboardType: isInt ? TextInputType.number : TextInputType.text,
      decoration: textFieldInputDecoration(label),
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter ' + label;
        }
        return null;
      },
    ),
  );
}

import 'package:btax/common/widget_properties/textStyle.dart';
import 'package:btax/user/setup/ui/setup_profile_screen.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

Widget textFormFieldDropdownButton(
  List list,
  String hint,
  TextEditingController controller,
  String selectedValue,
  String errorText, {
  double topPadding = 12,
  int fontSize = 14,
}) {
  return Padding(
    padding: EdgeInsets.only(top: topPadding),
    child: DropdownButtonFormField2(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: EdgeInsets.zero,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(width: 1.5, color: Colors.redAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(width: 1.5, color: Colors.blueAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(width: 1.5, color: Colors.white),
        ),
      ),
      hint: Text(
        hint,
        style: secondaryTextStyle(size: fontSize),
      ),
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
      ),
      iconSize: 30,
      buttonHeight: 44,
      buttonPadding: const EdgeInsets.only(left: 10, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      items: list
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      validator: (value) {
        if (value == null) {
          return errorText;
        }
        return null;
      },
      onChanged: (value) {
        controller.text = value.toString();
        //Do something when changing the item if you want.
      },
      onSaved: (value) {
        selectedValue = value.toString();
      },
    ),
  );
}

List idType = [
  'Passport',
  'Driving License',
  'Utility Bill',
  'Bank Statement',
  'Credit Card',
];
List gstAccountingMethod = [
  'GST on Sales',
  'GST on Purchase',
  'GST on Sales and Purchase',
];

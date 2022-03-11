import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(String label) {
  return InputDecoration(
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
    labelText: label,
    isDense: true,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
  );
}

import 'package:flutter/material.dart';

TextField textField(String Text, IconData icon, bool isPasswordType,
    TextEditingController? controller, TextInputType? type) {
  return TextField(
    keyboardType: type,
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    decoration: InputDecoration(
      prefixIcon: Icon(icon),
      hintStyle:
          const TextStyle(color: Color.fromARGB(255, 6, 6, 6), fontSize: 18),
      fillColor: Color.fromARGB(96, 254, 254, 254),
      filled: true,
      hintText: "${Text}",
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(25)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(25)),
    ),
  );
}

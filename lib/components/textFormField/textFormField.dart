import 'package:flutter/material.dart';

TextFormField searchField() {
  return TextFormField(
    decoration: InputDecoration(
        fillColor: Color.fromARGB(110, 223, 233, 241),
        filled: true,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(24)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(24)),
        prefixIcon: Icon(Icons.search_sharp),
        hintText: 'Find things to do'),
  );
}

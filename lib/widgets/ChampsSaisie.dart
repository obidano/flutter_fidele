import 'package:flutter/material.dart';

Widget ChampSaisie(
    {bool isPassword = false,
      String label = "",
      IconData prefixIcon = Icons.edit,
      required TextEditingController ctrl,
      TextInputType type = TextInputType.text,
      bool required=false}) {
  return TextFormField(
      obscureText: isPassword,
      controller: ctrl,
      keyboardType: type,
      validator: (String? value) {
        if(!required) return null;
        if ( value == null || value.isEmpty) {
          return "Champs obligatoire";
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          labelText: label,
          hintText: "Saisir...",
          border: _bordure(Colors.grey),
          focusedBorder: _bordure(Colors.orange),
          enabledBorder: _bordure(Colors.grey)));
}

OutlineInputBorder _bordure(MaterialColor _color) {
  return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: _color),
      borderRadius: BorderRadius.all(Radius.circular(16)));
}
import 'package:flutter/material.dart';

Widget Chargement([bool isVisible=false] ){
  return Visibility(
    visible: isVisible,
    child: Align(
        alignment: Alignment.center,
        child: Container(
            width: double.infinity,
            height: double.infinity,
            //color: Colors.grey.withOpacity(0.4),
            color: Colors.black12,
            child: Center(child: CircularProgressIndicator()))
    ),
  ) ;
}
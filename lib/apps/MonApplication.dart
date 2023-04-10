import 'package:flutter/material.dart';
import 'package:flutter_fidele/pages/Demo.dart';
import 'package:flutter_fidele/pages/FidelesPage.dart';
import 'package:flutter_fidele/pages/LoginPage.dart';

class MonApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FidelesPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_fidele/pages/Demo.dart';
import 'package:flutter_fidele/pages/FidelesPage.dart';
import 'package:flutter_fidele/pages/LoginPage.dart';
import 'package:provider/provider.dart';

import '../controllers/FideleCtrl.dart';
import '../pages/BrouillonPage.dart';

class MonApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> FideleCtrl()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}

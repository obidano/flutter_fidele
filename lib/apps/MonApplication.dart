import 'package:flutter/material.dart';
import 'package:flutter_fidele/controllers/EventCtrl.dart';
import 'package:flutter_fidele/pages/Demo.dart';
import 'package:flutter_fidele/pages/FidelesPage.dart';
import 'package:flutter_fidele/pages/LoginPage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../controllers/FideleCtrl.dart';
import '../controllers/UserCtrl.dart';
import '../pages/BrouillonPage.dart';
import '../utils/Stockage.dart';

class MonApplication extends StatelessWidget {
  var box=GetStorage();

  @override
  Widget build(BuildContext context) {
    var user=box.read<Map>(Stockage.userKey);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> FideleCtrl()),
        ChangeNotifierProvider(create: (_)=> UserCtrl(stockage: box )),
        ChangeNotifierProvider(create: (_)=> EventCtrl()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: user!=null? FidelesPage(): LoginPage(),
      ),
    );
  }
}

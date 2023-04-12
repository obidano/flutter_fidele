import 'package:flutter/material.dart';
import 'package:flutter_fidele/controllers/UserCtrl.dart';
import 'package:flutter_fidele/pages/FidelesPage.dart';
import 'package:flutter_fidele/widgets/ChampsSaisie.dart';
import 'package:provider/provider.dart';

import '../controllers/FideleCtrl.dart';
import '../widgets/Chargement.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color couleurFond = Colors.white;

  String errorMsg = "";
  bool isVisible = false;
  var formKey = GlobalKey<FormState>();
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: couleurFond,
      body: Stack(
        children: [_body(context), Chargement(isVisible)],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Form(
      key: formKey,
      child: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _iconApp(),
                SizedBox(
                  height: 20,
                ),
                Text("Authentification", style: TextStyle(fontSize: 20)),
                SizedBox(
                  height: 20,
                ),
                ChampSaisie(ctrl: username, label: "Username", required: true),
                SizedBox(
                  height: 20,
                ),
                ChampSaisie(
                    ctrl: password,
                    label: "Mot de passe",
                    required: true,
                    isPassword: true),
                SizedBox(
                  height: 20,
                ),
                _textError(),
                _buttonWidget(context),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _iconApp() {
    return Icon(
      Icons.home,
      size: 50,
      color: Colors.orange,
    );
  }

  Widget _buttonWidget(BuildContext ctx) {
    return Container(
      width: 500,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          FocusScope.of(context).requestFocus(new FocusNode());
          if (formKey.currentState?.validate()!=true) {
            return;
          }
          print(username.text);
          print(password.text);

          // return;
          errorMsg = "Mot de passe incorrect";
          isVisible = true;
          setState(() {});
          //traitement
          var ctrl = ctx.read<UserCtrl>();
          Map donneesAEnvoyer = {"username": username.text};
          bool status = await ctrl.authentifierUser(donneesAEnvoyer);
          await Future.delayed(Duration(seconds: 2));
          isVisible = false;
          setState(() {});
          if (status) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => FidelesPage()));
          }
        },
        child: Text("Connexion"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }

  Widget _textError() {
    return Text(errorMsg, style: TextStyle(color: Colors.red, fontSize: 16));
  }
}

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: couleurFond,
      body: Stack(
        children: [
          _body(context),
          Chargement(isVisible)
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
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
              _loginSaisie(),
              SizedBox(
                height: 20,
              ),
              _loginSaisie(),
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
    );
  }

  Widget _iconApp() {
    return Icon(
      Icons.home,
      size: 50,
      color: Colors.orange,
    );
  }

  Widget _loginSaisie() {
    return TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.verified_user),
            labelText: "Saisir Login",
            hintText: "Saisir...",
            border: _bordure(Colors.grey),
            focusedBorder: _bordure(Colors.orange),
            enabledBorder: _bordure(Colors.grey)));
  }

  Widget _buttonWidget(BuildContext ctx) {
    return Container(
      width: 500,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          errorMsg = "Mot de passe incorrect";
          isVisible=true;
          //traitement
          var ctrl=ctx.read<FideleCtrl>();
          Map donneesAEnvoyer={"username": "ODC"};
          ctrl.envoieDonneesAuth(donneesAEnvoyer);
          isVisible=false;

          setState(() {});
        },
        child: Text("Connexion"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }

  OutlineInputBorder _bordure(MaterialColor _color) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: _color),
        borderRadius: BorderRadius.all(Radius.circular(16)));
  }

  Widget _textError() {
    return Text(errorMsg, style: TextStyle(color: Colors.red, fontSize: 16));
  }
}

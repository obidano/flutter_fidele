import 'package:flutter/material.dart';
import 'package:flutter_fidele/models/FideleModele.dart';

import '../utils/Constantes.dart';

class FidelesPage extends StatefulWidget {
  const FidelesPage({Key? key}) : super(key: key);

  @override
  State<FidelesPage> createState() => _FidelesPageState();
}

class _FidelesPageState extends State<FidelesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title:
          Text("Liste des Fideles (0)", style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _body() {
    return ListView.builder(
        itemCount: Constantes.fakeFideleList.length,
        itemBuilder: (ctx, i) {
          var fidele = Constantes.fakeFideleList[i];
          var f = FideleModele.fromJson(fidele);
          // Text("${f.nom}")
          return ListTile(
            title: Text("${f.nom}"),
            subtitle: Text("${f.prenom}"),
            trailing: Icon(Icons.arrow_right),
            leading: f.image != null? Image.asset(f.image!) : Icon(Icons.error),
          );
        });
  }
}

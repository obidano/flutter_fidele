import 'package:flutter/material.dart';
import 'package:flutter_fidele/controllers/UserCtrl.dart';
import 'package:flutter_fidele/models/FideleModel.dart';
import 'package:flutter_fidele/pages/LoginPage.dart';
import 'package:flutter_fidele/utils/Stockage.dart';
import 'package:provider/provider.dart';

import '../controllers/FideleCtrl.dart';
import '../utils/Constantes.dart';

class FidelesPage extends StatefulWidget {
  const FidelesPage({Key? key}) : super(key: key);

  @override
  State<FidelesPage> createState() => _FidelesPageState();
}

class _FidelesPageState extends State<FidelesPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var fideleCtrl = context.read<FideleCtrl>();
      fideleCtrl.recuperDataAPI();

    });

  }

  @override
  Widget build(BuildContext context) {
    // var fideleCtrl = context.watch<FideleCtrl>();
    print("Recharge de la page");
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    var fideleCtrl = context.watch<FideleCtrl>();

    return AppBar(
      title: Text("Liste des Fideles (${fideleCtrl.fideles.length})",
          style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {
              setState(() {});
              return;
              var userCtrl = context.read<UserCtrl>();
              userCtrl.stockage?.remove(Stockage.userKey);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => LoginPage()));
            },
            color: Colors.black,
            icon: Icon(Icons.exit_to_app))
      ],
    );
  }

  Widget _body() {
    var userCtrl = context.watch<UserCtrl>();
    var fideleCtrl = context.watch<FideleCtrl>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Connecté en tant que: ${userCtrl.user?.username}"),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: fideleCtrl.fideles.length,
              itemBuilder: (ctx, i) {
                var f = fideleCtrl.fideles[i];
                //var f = FideleModel.fromJson(fidele);
                // Text("${f.nom}")
                return ListTile(
                  title: Text("${f.nom}"),
                  subtitle: Text("${f.prenom}"),
                  trailing: Icon(Icons.arrow_right),
                  leading: f.image != null
                      ? Image.network("${Constantes.BASE_URL}/${f.image!}")
                      : Icon(Icons.error),
                );
              }),
        ),
      ],
    );
  }
}

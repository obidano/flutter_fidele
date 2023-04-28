import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fidele/controllers/FideleCtrl.dart';
import 'package:flutter_fidele/widgets/Chargement.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../utils/Constantes.dart';
import '../widgets/ChampsSaisie.dart';

class FormFidelePage extends StatefulWidget {
  int? fidele_id;

  @override
  State<FormFidelePage> createState() => _FormFidelePageState();

  FormFidelePage({this.fidele_id});
}

class _FormFidelePageState extends State<FormFidelePage> {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var age = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool isVisible = false;
  final ImagePicker picker = ImagePicker();
  XFile? imageSelection;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var fideleCtrl = context.read<FideleCtrl>();

      var fidele =
          fideleCtrl.fideles.where((f) => f.id == widget.fidele_id).toList();
      print("Resultat recherche $fidele");
      if (fidele.length != 0) {
        var temp = fidele[0];
        print(temp.toJson());
        firstName = TextEditingController(text: temp.prenom);
        lastName = TextEditingController(text: temp.nom);
        age = TextEditingController(text: temp.age.toString());
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_body(), Chargement(isVisible)],
    ));
  }

  Widget _body() {
    return Form(
      key: formkey,
      child: Center(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _imageProfile(),
                SizedBox(
                  height: 20,
                ),
                Text("S'enregistrer", style: TextStyle(fontSize: 20)),
                SizedBox(
                  height: 20,
                ),
                ChampSaisie(
                    ctrl: firstName,
                    label: "Nom",
                    required: true,
                    isPassword: false),
                SizedBox(
                  height: 20,
                ),
                ChampSaisie(
                    ctrl: lastName,
                    label: "Prénom",
                    required: true,
                    isPassword: false),
                SizedBox(
                  height: 20,
                ),
                ChampSaisie(
                    ctrl: age,
                    label: "age",
                    type: TextInputType.number,
                    required: true,
                    isPassword: false),
                SizedBox(
                  height: 20,
                ),
                _buttonWidget(),
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

  Widget _imageProfile() {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () async {
            imageSelection =
                await picker.pickImage(source: ImageSource.gallery);

            if (imageSelection != null) {
              Directory directory = await getApplicationDocumentsDirectory();
              print(directory.path);
              print(imageSelection!.path);
              var a = imageSelection!.path.split("/");
              String filename = a.last;
              print(a);
              print(filename);
              imageSelection?.saveTo("${directory.path}/$filename");
            }

            setState(() {});
          },
          child: imageSelection == null
              ? CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage('assets/old-man.png'),
                )
              : CircleAvatar(
                  radius: 80.0,
                  backgroundImage: FileImage(File(imageSelection!.path)),
                ),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: Icon(
            Icons.camera_alt,
            color: Colors.teal,
            size: 20.0,
          ),
        )
      ],
    );
  }

  Widget _buttonWidget() {
    return Container(
      width: 500,
      height: 50,
      child: ElevatedButton(
        onPressed: _validerFormulaire,
        child: Text(widget.fidele_id == null ? "Créer" : "Modifier"),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
      ),
    );
  }

  void _validerFormulaire() async {
    print(firstName.text);
    print(lastName.text);
    print(age.text);
    FocusScope.of(context).requestFocus(new FocusNode());

    if (formkey.currentState?.validate() != true) {
      return;
    }
    var fideleCtrl = context.read<FideleCtrl>();
    var file = File(imageSelection!.path);
    List<int> imageBytes = await file.readAsBytesSync();
    String baseimage = base64Encode(imageBytes);

    Map dataAEnvoyer = {
      "prenom": firstName.text,
      "nom": lastName.text,
      "age": int.parse(age.text),
      "image": baseimage
    };
    print("image $dataAEnvoyer");
    print(json.encode(dataAEnvoyer));
   // return;
    fideleCtrl.createFideleAPI(dataAEnvoyer);
  }
}

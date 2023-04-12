import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fidele/models/UserModel.dart';
import 'package:flutter_fidele/utils/requetes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../utils/Constantes.dart';
import '../utils/Stockage.dart';

class UserCtrl with ChangeNotifier {
  UserModel? user;
  GetStorage? stockage;

  UserCtrl({this.stockage});

  Future<bool> authentifierUser(Map data) async {
    var url = "${Constantes.BASE_URL}${Constantes.authEndpoint}";
    Map? reponse = await postData(url, data);
    if (reponse != null) {
      user = UserModel.fromJson(reponse);
      stockage?.write(Stockage.userKey, user?.toJson());
      notifyListeners();
      print(user?.toJson());
    }
    return reponse != null;
  }
}

void main() {
  var ctrl = UserCtrl();
  Map data = {"username": "ODC"};
  ctrl.authentifierUser(data);
}

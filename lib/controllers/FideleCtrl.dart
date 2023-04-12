import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fidele/utils/Constantes.dart';
import 'package:flutter_fidele/utils/requetes.dart';
import 'package:http/http.dart' as http;
import '../models/FideleModel.dart';

class FideleCtrl with ChangeNotifier {
  List<FideleModel> fideles = [];
  bool loading = false;


  void recuperDataAPI() async {
    var url = "${Constantes.BASE_URL}${Constantes.fidelesEndpoint}";
    print(url);
    loading = true;
    notifyListeners();
    var reponse = await getData(url);
    if(reponse!=null){
      List<FideleModel> temp= reponse
          .map<FideleModel>((e) => FideleModel.fromJson(e)).toList();
      fideles=temp;
      notifyListeners();
      /*for(var r in reponse){
        var r_temp=FideleModel.fromJson(r);
        temp.add(r_temp);
      }*/
    }
    loading = false;
    notifyListeners();
  }
}

void main() {
  var f = FideleCtrl();
  f.recuperDataAPI();
}

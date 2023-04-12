import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fidele/utils/Constantes.dart';
import 'package:flutter_fidele/utils/requetes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../models/FideleModel.dart';
import '../utils/Stockage.dart';

class FideleCtrl with ChangeNotifier {
  List<FideleModel> fideles = [];
  bool loading = false;
  GetStorage? stockage;

  FideleCtrl({this.stockage});

  void recuperDataAPI() async {
    var url = "${Constantes.BASE_URL}${Constantes.fidelesEndpoint}";
    print(url);
    loading = true;
    notifyListeners();
    var reponse = await getData(url);
    print(reponse);
    if(reponse!=null){
      List<FideleModel> temp= reponse
          .map<FideleModel>((e) => FideleModel.fromJson(e)).toList();
      fideles=temp;
      stockage?.write(Stockage.fidelesKey, reponse);
      notifyListeners();
      /*for(var r in reponse){
        var r_temp=FideleModel.fromJson(r);
        temp.add(r_temp);
      }*/
    }else{
      var dataStockee= stockage?.read(Stockage.fidelesKey);
      var temp= dataStockee.map<FideleModel>(
              (e)=> FideleModel.fromJson(e) ).toList();
      fideles=temp;
      notifyListeners();
      print("data stockee:  $temp");
    }
    loading = false;
    notifyListeners();
  }
}

void main() {
  var f = FideleCtrl();
  f.recuperDataAPI();
}

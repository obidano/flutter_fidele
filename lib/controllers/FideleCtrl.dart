
import 'package:flutter/material.dart';
import 'package:flutter_fidele/utils/Constantes.dart';
import 'package:http/http.dart' as http;
import '../models/FideleModele.dart';

class FideleCtrl with ChangeNotifier{
  List<FideleModele> fideles=[];
  bool loading=false;

  void recuperDataAPI() async{
      var url=Uri.parse("${Constantes.BASE_URL}${Constantes.fidelesEndpoint}");
      loading=true;
      notifyListeners();
      var reponse= await http.get(url);
      print(reponse.runtimeType);
      print(reponse.body.runtimeType);
      print(reponse.body); // contient le resultat de la reponse
      print(reponse.statusCode); // contient le code http
      loading=false;
      notifyListeners();

  }

}

void main(){
  var f= FideleCtrl();
  f.recuperDataAPI();
}
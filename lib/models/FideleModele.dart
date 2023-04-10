// To parse this JSON data, do
//
//     final fideleModele = fideleModeleFromJson(jsonString);

import 'dart:convert';

FideleModele fideleModeleFromJson(String str) => FideleModele.fromJson(json.decode(str));

String fideleModeleToJson(FideleModele data) => json.encode(data.toJson());

class FideleModele {
  FideleModele({
    this.id,
    this.prenom,
    this.nom,
    this.age,
    this.image,
  });

  int? id;
  String? prenom;
  String? nom;
  int? age;
  String? image;

  factory FideleModele.fromJson(Map json) => FideleModele(
    id: json["id"],
    prenom: json["prenom"],
    nom: json["nom"],
    age: json["age"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "prenom": prenom,
    "nom": nom,
    "age": age,
    "image": image,
  };
}

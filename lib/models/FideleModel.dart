// To parse this JSON data, do
//
//     final fideleModele = fideleModeleFromJson(jsonString);

import 'dart:convert';

FideleModel fideleModeleFromJson(String str) => FideleModel.fromJson(json.decode(str));

String fideleModeleToJson(FideleModel data) => json.encode(data.toJson());

class FideleModel {
  FideleModel({
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

  factory FideleModel.fromJson(Map json) => FideleModel(
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

// To parse this JSON data, do
//
//     final eventModele = eventModeleFromJson(jsonString);

import 'dart:convert';

EventModel eventModeleFromJson(String str) => EventModel.fromJson(json.decode(str));

String eventModeleToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    this.id,
    this.nom,
    this.date,
    this.reservable,
    this.moderateur,
  });

  int? id;
  String? nom;
  DateTime? date;
  bool? reservable;
  String? moderateur;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    id: json["id"],
    nom: json["nom"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    reservable: json["reservable"],
    moderateur: json["moderateur"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "date": date?.toIso8601String(),
    "reservable": reservable,
    "moderateur": moderateur,
  };
}

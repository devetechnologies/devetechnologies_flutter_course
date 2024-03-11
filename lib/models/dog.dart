import 'dart:convert';

Dog dogFromJson(String str) => Dog.fromJson(json.decode(str));

String dogToJson(Dog data) => json.encode(data.toJson());

class Dog {
  Eight? weight;
  Eight? height;
  int? id;
  String? name;
  String? bredFor;
  String? breedGroup;
  String? lifeSpan;
  String? temperament;
  String? origin;
  String? referenceImageId;

  Dog({
    this.weight,
    this.height,
    this.id,
    this.name,
    this.bredFor,
    this.breedGroup,
    this.lifeSpan,
    this.temperament,
    this.origin,
    this.referenceImageId,
  });

  factory Dog.fromJson(Map<String, dynamic> json) => Dog(
        weight: Eight.fromJson(json["weight"]),
        height: Eight.fromJson(json["height"]),
        id: json["id"],
        name: json["name"],
        bredFor: json["bred_for"],
        breedGroup: json["breed_group"],
        lifeSpan: json["life_span"],
        temperament: json["temperament"],
        origin: json["origin"],
        referenceImageId: json["reference_image_id"],
      );

  Map<String, dynamic> toJson() => {
        "weight": weight!.toJson(),
        "height": height!.toJson(),
        "id": id,
        "name": name,
        "bred_for": bredFor,
        "breed_group": breedGroup,
        "life_span": lifeSpan,
        "temperament": temperament,
        "origin": origin,
        "reference_image_id": referenceImageId,
      };
}

class Eight {
  String? imperial;
  String? metric;

  Eight({
    this.imperial,
    this.metric,
  });

  factory Eight.fromJson(Map<String, dynamic> json) => Eight(
        imperial: json["imperial"],
        metric: json["metric"],
      );

  Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
      };
}

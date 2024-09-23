import 'dart:convert';

import 'package:challenge_pragma_msolimano/src/domain/models/image_cat.dart';
import 'package:challenge_pragma_msolimano/src/domain/models/weight_cat.dart';

Cat catFromJson(String str) => Cat.fromJson(json.decode(str));

String catToJson(Cat data) => json.encode(data.toJson());

class Cat {
  Weight? weight;
  String? id;
  String? name;
  String? temperament;
  String? origin;
  String? countryCodes;
  String? countryCode;
  String? description;
  String? lifeSpan;
  int? indoor;
  int? lap;
  String? altNames;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  int? vocalisation;
  int? experimental;
  int? hairless;
  int? natural;
  int? rare;
  int? rex;
  int? suppressedTail;
  int? shortLegs;
  String? wikipediaUrl;
  int? hypoallergenic;
  String? referenceImageId;
  Image? image;

  Cat({
    this.weight,
    this.id,
    this.name,
    this.temperament,
    this.origin,
    this.countryCodes,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.indoor,
    this.lap,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.vocalisation,
    this.experimental,
    this.hairless,
    this.natural,
    this.rare,
    this.rex,
    this.suppressedTail,
    this.shortLegs,
    this.wikipediaUrl,
    this.hypoallergenic,
    this.referenceImageId,
    this.image,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    try {
      return Cat(
          weight: Weight.fromJson(json["weight"]),
          id: json["id"],
          name: json["name"],
          temperament: json["temperament"],
          origin: json["origin"],
          countryCodes: json["country_codes"],
          countryCode: json["country_code"],
          description: json["description"],
          lifeSpan: json["life_span"],
          indoor: json["indoor"],
          lap: json["lap"],
          altNames: json["alt_names"],
          adaptability: json["adaptability"],
          affectionLevel: json["affection_level"],
          childFriendly: json["child_friendly"],
          dogFriendly: json["dog_friendly"],
          energyLevel: json["energy_level"],
          grooming: json["grooming"],
          healthIssues: json["health_issues"],
          intelligence: json["intelligence"],
          sheddingLevel: json["shedding_level"],
          socialNeeds: json["social_needs"],
          strangerFriendly: json["stranger_friendly"],
          vocalisation: json["vocalisation"],
          experimental: json["experimental"],
          hairless: json["hairless"],
          natural: json["natural"],
          rare: json["rare"],
          rex: json["rex"],
          suppressedTail: json["suppressed_tail"],
          shortLegs: json["short_legs"],
          wikipediaUrl: json["wikipedia_url"],
          hypoallergenic: json["hypoallergenic"],
          referenceImageId: json["reference_image_id"],
          image: json["image"] == null ? null : Image.fromJson(json["image"]));
    } catch (e) {
      print(json["image"]);
      return Cat();
    }
  }

  Map<String, dynamic> toJson() => {
        "weight": weight?.toJson(),
        "id": id,
        "name": name,
        "temperament": temperament,
        "origin": origin,
        "country_codes": countryCodes,
        "country_code": countryCode,
        "description": description,
        "life_span": lifeSpan,
        "indoor": indoor,
        "lap": lap,
        "alt_names": altNames,
        "adaptability": adaptability,
        "affection_level": affectionLevel,
        "child_friendly": childFriendly,
        "dog_friendly": dogFriendly,
        "energy_level": energyLevel,
        "grooming": grooming,
        "health_issues": healthIssues,
        "intelligence": intelligence,
        "shedding_level": sheddingLevel,
        "social_needs": socialNeeds,
        "stranger_friendly": strangerFriendly,
        "vocalisation": vocalisation,
        "experimental": experimental,
        "hairless": hairless,
        "natural": natural,
        "rare": rare,
        "rex": rex,
        "suppressed_tail": suppressedTail,
        "short_legs": shortLegs,
        "wikipedia_url": wikipediaUrl,
        "hypoallergenic": hypoallergenic,
        "reference_image_id": referenceImageId,
        "image": image?.toJson(),
      };
}

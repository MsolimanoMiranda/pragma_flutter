import 'dart:convert';

import 'package:challenge_pragma_msolimano/src/domain/models/cat.dart';

ListCats catsListFromJson(String str) => ListCats.fromJson(json.decode(str));

String catsListToJson(ListCats data) => json.encode(data.toJson());

class ListCats {
  List<Cat> cats;

  ListCats({
    required this.cats,
  });

  factory ListCats.fromJson(Map<String, dynamic> json) => ListCats(
        cats: List<Cat>.from(json["totes"].map((x) => Cat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totes": List<dynamic>.from(cats.map((x) => x.toJson())),
      };

  factory ListCats.fromJsonList(List<dynamic> list) => ListCats(
        cats: List<Cat>.from(list.map((x) {
          return Cat.fromJson(x);
        })),
      );
}

class Image {
  String? id;
  int? width;
  int? height;
  String? url;

  Image({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "url": url,
      };
}

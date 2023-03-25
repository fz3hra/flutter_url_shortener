import 'dart:convert';

class Link {
  Link({
    required this.createdAt,
    required this.id,
    required this.link,
    required this.customBitlinks,
    required this.longUrl,
    required this.archived,
    required this.tags,
    required this.deeplinks,
    required this.references,
  });

  final String createdAt;
  final String id;
  final String link;
  final List<dynamic> customBitlinks;
  final String longUrl;
  final bool archived;
  final List<dynamic> tags;
  final List<dynamic> deeplinks;
  final References references;

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        createdAt: json["created_at"],
        id: json["id"],
        link: json["link"],
        customBitlinks:
            List<dynamic>.from(json["custom_bitlinks"].map((x) => x)),
        longUrl: json["long_url"],
        archived: json["archived"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        deeplinks: List<dynamic>.from(json["deeplinks"].map((x) => x)),
        references: References.fromJson(json["references"]),
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "id": id,
        "link": link,
        "custom_bitlinks": List<dynamic>.from(customBitlinks.map((x) => x)),
        "long_url": longUrl,
        "archived": archived,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "deeplinks": List<dynamic>.from(deeplinks.map((x) => x)),
        "references": references.toJson(),
      };
}

class References {
  References({
    required this.group,
  });

  final String group;

  factory References.fromRawJson(String str) =>
      References.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory References.fromJson(Map<String, dynamic> json) => References(
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "group": group,
      };
}

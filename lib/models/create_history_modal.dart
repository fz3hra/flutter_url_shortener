class CreateHistoryModal {
  final int id;
  final String shortLink, longLink;
  // final String shortLink;
  CreateHistoryModal({
    required this.id,
    required this.shortLink,
    required this.longLink,
    // required this.shortLink,
  });
  CreateHistoryModal.fromMap(Map<String, dynamic> json)
      : id = json["id"],
        shortLink = json["shortLink"],
        longLink = json["longLink"];
  // shortLink = json["shortLink"]
  Map<String, Object> toMap() {
    return {
      'id': id,
      'shortLink': shortLink,
      'longLink': longLink,
      // 'shortLink': shortLink,
    };
  }
}

class CreateHistoryModal {
  final int id;
  final String longLink, shortLink;
  CreateHistoryModal({
    required this.id,
    required this.longLink,
    required this.shortLink,
  });
  CreateHistoryModal.fromMap(Map<String, dynamic> json)
      : id = json["id"],
        longLink = json["longLink"],
        shortLink = json["shortLink"];
  Map<String, Object> toMap() {
    return {
      'id': id,
      'longLink': longLink,
      'shortLink': shortLink,
    };
  }
}

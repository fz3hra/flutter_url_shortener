class CreateHistoryModal {
  final int id;
  final String linkName, longLink;
  // final String shortLink;
  CreateHistoryModal({
    required this.id,
    required this.linkName,
    required this.longLink,
    // required this.shortLink,
  });
  CreateHistoryModal.fromMap(Map<String, dynamic> json)
      : id = json["id"],
        linkName = json["linkName"],
        longLink = json["longLink"];
  // shortLink = json["shortLink"]
  Map<String, Object> toMap() {
    return {
      'id': id,
      'linkName': linkName,
      'longLink': longLink,
      // 'shortLink': shortLink,
    };
  }
}

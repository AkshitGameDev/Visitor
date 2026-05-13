class Visitor {
  final String id;
  final String name;
  final String email;
  final String phone;

  final String purpose;
  final DateTime entryTime;
  final DateTime? exitTime;

  Visitor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,

    required this.purpose,
    required this.entryTime,
    this.exitTime,
  });

  bool get isPunchedOut => exitTime != null;

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      id: json["_id"] ?? json["id"],
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",

      // NEW
      purpose: json["purpose"] ?? "",
      entryTime: DateTime.parse(
        json["entryTime"] ?? DateTime.now().toIso8601String(),
      ),
      exitTime: json["exitTime"] != null
          ? DateTime.parse(json["exitTime"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,

      // NEW
      "purpose": purpose,
      "entryTime": entryTime.toIso8601String(),
      "exitTime": exitTime?.toIso8601String(),
    };
  }
}
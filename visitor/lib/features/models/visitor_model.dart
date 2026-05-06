class Visitor {
  final String id;
  final String name;
  final String email;
  final String phone;

  Visitor({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory Visitor.fromJson(Map<String, dynamic> json) {
    return Visitor(
      id: json["_id"] ?? json["id"],
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
    };
  }
}
class Visitor {
  final String id;
  String name;
  String purpose;
  String phone;
  String email;
  String company;
  DateTime checkInTime;
  DateTime? checkOutTime;

  Visitor({
    required this.id,
    required this.name,
    required this.purpose,
    this.phone = '',
    this.email = '',
    this.company = '',
    required this.checkInTime,
    this.checkOutTime,
  });

  bool get isPunchedOut => checkOutTime != null;
}
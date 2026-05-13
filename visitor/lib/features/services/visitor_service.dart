import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/visitor_model.dart';

class VisitorService {
  static const String baseUrl = 'https://visitor-api-58oi.onrender.com/api/visitors';

  Future<List<Visitor>> getVisitors() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((item) => Visitor.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch visitors');
    }
  }

  Future<Visitor> addVisitor(Visitor visitor) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(visitor.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return Visitor.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to add visitor');
    }
  }

  Future<Visitor> updateVisitor(String id, Visitor visitor) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(visitor.toJson()),
    );

    if (response.statusCode == 200) {
      return Visitor.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update visitor');
    }
  }

  Future<void> deleteVisitor(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete visitor');
    }
  }

  Future<Visitor> punchOutVisitor(String id) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id/punch-out'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'exitTime': DateTime.now().toIso8601String(),
      }),
    );

    if (response.statusCode == 200) {
      return Visitor.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to punch out visitor');
    }
  }
}
import '../../../core/network/api_client.dart';
import '../models/visitor_model.dart';

class VisitorService {
  final String endpoint = "/visitors";

  Future<List<Visitor>> getVisitors() async {
    final response = await ApiClient.dio.get(endpoint);

    return (response.data as List)
        .map((json) => Visitor.fromJson(json))
        .toList();
  }

  Future<Visitor> createVisitor(Visitor visitor) async {
    final response = await ApiClient.dio.post(
      endpoint,
      data: visitor.toJson(),
    );

    return Visitor.fromJson(response.data);
  }

  Future<Visitor> updateVisitor(String id, Visitor visitor) async {
    final response = await ApiClient.dio.put(
      "$endpoint/$id",
      data: visitor.toJson(),
    );

    return Visitor.fromJson(response.data);
  }

  Future<void> deleteVisitor(String id) async {
    await ApiClient.dio.delete("$endpoint/$id");
  }
}
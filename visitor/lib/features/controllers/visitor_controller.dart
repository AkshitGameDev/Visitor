import 'package:get/get.dart';
import '../models/visitor_model.dart';
import '../services/visitor_service.dart';

class VisitorController extends GetxController {
  final VisitorService _service = VisitorService();

  var visitors = <Visitor>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVisitors();
  }

  Future<void> fetchVisitors() async {
    try {
      isLoading.value = true;
      visitors.value = await _service.getVisitors();
    } catch (e) {
      Get.snackbar("Error", "Failed to load visitors");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addVisitor(Visitor visitor) async {
    try {
      final newVisitor = await _service.createVisitor(visitor);
      visitors.add(newVisitor);
      Get.snackbar("Success", "Visitor added");
    } catch (e) {
      Get.snackbar("Error", "Failed to add visitor");
    }
  }

  Future<void> editVisitor(String id, Visitor visitor) async {
    try {
      final updated = await _service.updateVisitor(id, visitor);
      final index = visitors.indexWhere((v) => v.id == id);

      if (index != -1) {
        visitors[index] = updated;
      }

      Get.snackbar("Success", "Visitor updated");
    } catch (e) {
      Get.snackbar("Error", "Failed to update visitor");
    }
  }

  Future<void> removeVisitor(String id) async {
    try {
      await _service.deleteVisitor(id);
      visitors.removeWhere((v) => v.id == id);
      Get.snackbar("Success", "Visitor deleted");
    } catch (e) {
      Get.snackbar("Error", "Failed to delete visitor");
    }
  }
}
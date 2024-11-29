

import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/user_list_api_service.dart';

class UserListController extends GetxController {
  final ApiService _apiService = ApiService();
  var users = <UserModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      users.value = await _apiService.fetchUsers();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }
}

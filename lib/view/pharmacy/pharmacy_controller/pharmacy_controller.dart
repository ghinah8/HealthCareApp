import 'dart:convert';
import 'package:get/get.dart';
import 'package:healthcare/modle/getallmedicine.dart';
import 'package:healthcare/service/link.dart';
import 'package:http/http.dart' as http;

class PharmacyController extends GetxController {
  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(
        Uri.parse(AppLink.products),
        headers: AppLink.getHeader(),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final model = Productmoudel.fromJson(data);
        products.value = model.products;
      } else {
        Get.snackbar("Error", "Failed to load products");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}

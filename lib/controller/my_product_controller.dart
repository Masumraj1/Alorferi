import 'dart:convert';
import 'dart:io';
import 'package:alorferi_app_practice/controller/log_in_controller.dart';
import 'package:alorferi_app_practice/token_shareprefe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constant/endpoint.dart';
import '../constant/urls.dart';

class MyProductController extends GetxController {
  RxList myProduct = [].obs;
  RxBool isLoading = false.obs;

  var loginController = Get.find<LogInController>();
  static const String apiUrl = "${Urls.apiServerBaseUrl}${Endpoints.myProduct}";

  @override
  void onInit() {
    super.onInit();
    loginController;
    getMyProducts();
  }

  Future<void> getMyProducts() async {

     // var token = loginController.token;
      var token = await TokenSharePrefences.loadToken();
    try {
      isLoading.value = true;

      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      isLoading.value = false;
      print("Statuse code : ${response.statusCode}");
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        List productData = responseData['data'];
        myProduct.value = List.from(productData);
        print("Product fetch successful");
        refresh();
      } else {
        print("Products fetch failed with status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error =============================>: $e ");
    }
  }



  // Future<void> updateProduct(String id, Map<String, dynamic> updatedProduct) async {
  //   try {
  //     isLoading.value = true;
  //     var token = loginController.token;
  //     final response = await http.put(
  //       Uri.parse('$apiUrl/$id'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         "Authorization": "Bearer $token",
  //       },
  //       body: json.encode(updatedProduct),
  //     );
  //
  //     isLoading.value = false;
  //     if (response.statusCode != 200) {
  //       throw Exception('Failed to update product');
  //     }
  //   } catch (e) {
  //     print('Error updating product: $e');
  //   }
  // }

  Future<void> deleteProduct(String id) async {
    try {
      isLoading.value = true;
      var token = await TokenSharePrefences.loadToken();
      final response = await http.delete(
        Uri.parse('$apiUrl/$id'),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
        },
      );
      print(token);
      isLoading.value = false;
      if (response.statusCode != 204) {
        throw Exception('Delete product succuss ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting product: $e');
    }
  }

  Future<void> createProductWithImage( Map<String, dynamic> product, File? imageFile) async {
    try {
      isLoading.value = true;
      var token = await TokenSharePrefences.loadToken();
      var request = http.MultipartRequest('POST', Uri.parse("${apiUrl}"));
      request.headers['Authorization'] = 'Bearer $token';

      // Add product data to the request
      request.fields.addAll(product.map((key, value) => MapEntry(key, value.toString())));

      if (imageFile != null) {
        request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
      }

      var response = await request.send();

      isLoading.value = false;
      if (response.statusCode == 201) {
        print('Product created successfully');
      } else {
        print('Failed to create product. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error creating product: $error');
    }
  }







  Future<void> updateProduct(String id, Map<String, dynamic> updatedProduct, File? imageFile) async {
    try {
      isLoading.value = true;
      var token = await TokenSharePrefences.loadToken();
      var request = http.MultipartRequest('PUT', Uri.parse("${apiUrl}/${id}"));
      request.headers['Authorization'] = 'Bearer $token';

      // Add product data to the request
      request.fields.addAll(updatedProduct.map((key, value) => MapEntry(key, value.toString())));

      if (imageFile != null) {
        request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));
      }

      var response = await request.send();

      isLoading.value = false;
      if (response.statusCode == 201) {
        print('Product created successfully');
      } else {
        print('Failed to create product. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error creating product: $error');
    }
  }


}

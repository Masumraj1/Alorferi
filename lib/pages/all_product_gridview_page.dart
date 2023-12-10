import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_to_card_controller.dart';
import '../controller/product_controller.dart';
import '../widgets/product_gridview.dart';

class AllProductGridViewPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  AddToCartController addToCartController = Get.put(AddToCartController());
  ScrollController scrollController = ScrollController();

  AllProductGridViewPage() {
    // Constructor - Fetch data when the widget is created
    productController.getProducts();

    // loading new data when the user scrolls down
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        productController.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController=TextEditingController();
    return Scaffold(

      body: Obx(() {
        if (productController.isLoading.value &&
            productController.currentPage == 1) {
          // Display a loading indicator only when the first page is being loaded
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            controller: scrollController,
            itemCount: productController.products.length + 1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              if (index < productController.products.length) {
                var product = productController.products[index];
                return ProductGridView(
                    product: product, addToCartController: addToCartController);
              } else {
                // Display a loading indicator at the bottom when more data is being loaded
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        }
      })


    );
  }
}

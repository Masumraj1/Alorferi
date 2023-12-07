
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/add_to_card_controller.dart';

class AddToCartProductPage extends StatelessWidget {
  final AddToCartController addToCartController = Get.find<AddToCartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Shopping Cart',style: TextStyle(color: Colors.deepPurpleAccent),),centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                final cartItems = addToCartController.cartItems;
                return ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Card(
                      color: Colors.white,
                      child: Container(
                        height: 160,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: item["url"] == null
                                  ? Image.network(
                                  "https://e7.pngegg.com/pngimages/344/673/png-clipart-empty-set-null-set-mathematical-notation-set-notation-mathematics-rim-black-and-white.png")
                                  : Image.network("https://demo.alorferi.com${item["url"]}"),
                            ),


                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Text(item['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                                  Text("price : ৳ ${item['price']}"),

                                  SizedBox(height: 10,),
                                  Text("Total Quantity :${item["stock_quantity"]}"),

                                  Container(
                                    color: Colors.white,
                                    padding: EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        IconButton(onPressed: (){
                                          addToCartController.removeFromCart(item);
                                        }, icon: Icon(Icons.remove,size: 40,color: Colors.blue,),),


                                        Text("${item["quantity"]}",style: TextStyle(fontSize: 20),),
                                        IconButton(onPressed: (){
                                          addToCartController.addToCart(item);
                                        }, icon: Icon(Icons.add,size: 36,color: Colors.blue,)),
                                      ],
                                    ),
                                  )


                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            Divider(),
            ListTile(
              title: Text('Total Amount: \$${addToCartController.getTotalAmount()}'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Implement checkout logic
                  // You can navigate to a checkout page or perform any other action here
                },
                child: Text('Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




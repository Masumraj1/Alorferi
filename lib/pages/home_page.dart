import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/add_to_card_controller.dart';
import 'add_to_card_product_page.dart';
import 'my_pruduct_crud_page.dart';
import 'all_product_gridview_page.dart';
import 'seller_grid_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AddToCartController addToCartController = Get.put(AddToCartController());

  late TabController _tabController;

  @override
  void initState() {
    addToCartController.cartItems;
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Text(
          "BD_Electronics",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Badge(
                label:
                    Obx(() => Text("${addToCartController.cartItems.length}")),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
            onPressed: () {
              Get.to(() => AddToCartProductPage());

              ///AddToCartProductPage());
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: "All Products",
            ),
            Tab(
              text: "Seller",
            ),
          ],
        ),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.blueGrey),

          // tabVarView use korte hobe and tabController
          child: TabBarView(controller: _tabController, children: [
            Container(
                height: 200,
                width: 200,
                color: Colors.yellow,
                child: AllProductGridViewPage()),
            Container(
                height: 200,
                width: 200,
                color: Colors.purple,
                child: SellerGridViewPage()),
          ])),
      drawer: Drawer(
        backgroundColor: Colors.purple,
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              children: [
                CircleAvatar(
                  child: Image.network(
                      "https://demo.alorferi.com/images/blank_product_picture.png"),
                )
              ],
            )),
            Column(
              children: [
                ListTile(

                  onTap: () {
                    Get.to(MyProductsCrudPage());
                  },
                  title: Text("My Products",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  title: Text("Share",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  title: Text("Settings",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ),
                ListTile(
                  title: Text("LogOut",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

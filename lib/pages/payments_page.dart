import 'package:alorferi_app_practice/controller/add_to_card_controller.dart';
import 'package:alorferi_app_practice/pages/all_product_gridview_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentGatway extends StatefulWidget{

  num? amount;

  PaymentGatway({super.key, required this.amount});

  @override
  State<PaymentGatway> createState() => _PaymentGatwayState();
}

class _PaymentGatwayState extends State<PaymentGatway> {

  final AddToCartController addToCartController = Get.find<AddToCartController>();

  int cvalue = 0;

  void selecte(int value) {
    setState(() {
      cvalue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Payments"),),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [

              Text("Payable Amount : ৳ ${widget.amount}"?? "" ,style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),maxLines: 1,),


              SizedBox(height: 50,),

              Align(

                  alignment: Alignment.centerLeft,
                  child: Text("Choose Account",style: TextStyle(fontSize: 26),)),
              SizedBox(height: 22,),

              RadioListTile(
                  value: 1,
                  groupValue: cvalue,
                  secondary: Container(
                      margin: EdgeInsets.only(left: 50),
                      height: 80,
                      width: 100,
                      child: Image.asset("assets/nagad.png")),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Colors.cyan,
                  onChanged: (staus) {
                    selecte(staus!);
                  }),
              RadioListTile(
                  value: 2,
                  groupValue: cvalue,
                  subtitle: Container(
                      height: 80,
                      width: 100,
                      child: Image.asset("assets/rocket.png")),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Colors.cyan,
                  onChanged: (staus) {
                    selecte(staus!);
                  }),
              RadioListTile(
                  value: 3,
                  groupValue: cvalue,
                  secondary: Container(
                      margin: EdgeInsets.only(left: 50),
                      height: 80,
                      width: 100,
                      child: Image.asset("assets/bkash.png")),
                  controlAffinity: ListTileControlAffinity.trailing,
                  activeColor: Colors.cyan,
                  onChanged: (staus) {
                    selecte(staus!);
                  }),



              SizedBox(height: 40,),
              ListTile(
                  title: ElevatedButton(onPressed: (){
                    setState(() {
                      addToCartController.clearCart();
                      Navigator.pop(context);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Payment successful')));
                  }, child: Text("Submit")))
            ],
          ),
        ),
      ),
    );
  }
}
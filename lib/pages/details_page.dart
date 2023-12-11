import 'package:flutter/material.dart';

import '../constant/urls.dart';

class DetailsPage extends StatelessWidget {
  
  var product;
  DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${product['name']}"),),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Container(
              height:350,
              width: double.infinity,
              child: product['url']== null ? Image.network("src") : Image.network("${Urls.apiServerBaseUrl}${product['url']}")),
          
          Text("${product['name']}", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          Text("${product['price']}"),
          
          Row(
            children: [
              Icon(Icons.star,color: Colors.red,),
              Icon(Icons.star,color: Colors.red,),
              Icon(Icons.star,color: Colors.red,),
              Icon(Icons.star,color: Colors.red,),
              Icon(Icons.star,color: Colors.red,),
            ],
          ),
          
          
          Text("${product['']}")
        ],
      ),
    );
  }
}

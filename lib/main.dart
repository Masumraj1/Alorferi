import 'package:alorferi_app_practice/controller/log_in_controller.dart';
import 'package:alorferi_app_practice/token_shareprefe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/home_page.dart';
import 'pages/log_in_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  LogInController logInController = Get.put(LogInController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        home: FutureBuilder(
         future: TokenSharePrefences.loadToken(),
         builder: (context, snapshot) {
           if(snapshot.data == null){
             return LogInPage();
           }
           else{
            return HomePage();
           }
         },
       )
    );
  }
}

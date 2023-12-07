import 'package:flutter/material.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Color(0xFF000000),

            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Container(
                  height: 200,
                  child: Center(
                      child: Image.asset(
                        "assets/forget.png",
                        fit: BoxFit.cover,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(fontSize: 35,color: Colors.purple),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Provide your email and we will sent you a like to reset your password',
                        style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter your Gmail',
                      labelStyle: TextStyle(fontSize: 16,color: Colors.white),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(
                    height: 40,
                    width: 250,
                    child: ElevatedButton(onPressed: (){}, child: Text('Reset Password')))
              ],
            ),
          ),
        ));
  }
}

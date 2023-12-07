import 'package:alorferi_app_practice/controller/log_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Forgotscreen.dart';
import 'sign_up_page.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  LogInController logInController = Get.put(LogInController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  child: Image.asset('assets/pic.png'),
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      label: Text(
                        "Enter you email",
                        style: TextStyle(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13))),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      label: Text(
                        "Enter you password",
                        style: TextStyle(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Ramamber me",
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                      onPressed: () {
                        Get.to(ForgotScreen());
                      },
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      _logIn();
                    },
                    child: Text("Log In")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "You don't have an acount?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignUpPage());
                      },
                      child: Text(
                        "     Sign Up",
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logIn() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    logInController.login(email, password);
  }
}

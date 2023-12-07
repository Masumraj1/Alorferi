import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/sign_up_controller.dart';
import 'log_in_page.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {

  SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationController = TextEditingController();
  var isSecure = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 120),
            Text("Hellow, friends!", style: TextStyle(fontSize: 30,color: Colors.white),),
            SizedBox(height: 50,),
            TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: "Enter your Name",
                labelStyle: TextStyle(color: Colors.white),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Enter your Email",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 16),
            Obx(() => TextFormField(
              controller: passwordController,
              obscureText: isSecure.value,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    isSecure.value = !isSecure.value;
                  },
                  child: Icon(
                    isSecure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                labelText: "Enter your Password",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )),
            SizedBox(height: 16),
            Obx(() => TextFormField(
              controller: confirmationController,
              obscureText: isSecure.value,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () {
                    isSecure.value = !isSecure.value;
                  },
                  child: Icon(
                    isSecure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                labelText: "Confirm your Password",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                signUpController.CreateUser(
                  userNameController.text,
                  emailController.text,
                  passwordController.text,
                  confirmationController.text,
                );
              },
              child: Text("Create Account"),
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
                    )),
                Expanded(
                    flex: 1,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  LogInPage()),
                          );
                        },
                        child: Text(
                          'Signin',
                          style:
                          TextStyle(fontSize: 25, color: Colors.purple,fontWeight: FontWeight.bold),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

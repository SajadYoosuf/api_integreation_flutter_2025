import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/login_service.dart';

class AswinLoginPage extends StatefulWidget {
  const AswinLoginPage({super.key});

  @override
  State<AswinLoginPage> createState() => _AswinLoginPageState();
}

class _AswinLoginPageState extends State<AswinLoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;
  final snakBar = SnackBar(
    content: Text("Login Successful"),
    action: SnackBarAction(label: "Undo", onPressed: () {}),
  );
  void login() async{
    var req_data={
      "email": emailController.text,
      "password": passwordController.text
    };
    ScaffoldMessenger.of(context).showSnackBar(snakBar);

  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(child: Text("Login screen")),
          SizedBox(height: 20),

          Center(
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,

              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
            ),
          ),
          Center(
            child: TextField(
              obscuringCharacter: ".",
              obscureText: isPasswordVisible,
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (isPasswordVisible) {
                      isPasswordVisible = false;
                    } else {
                      isPasswordVisible = true;
                    }
                    setState(() {});
                    print(isPasswordVisible);
                  },
                  icon: isPasswordVisible
                      ? Icon(Icons.remove_red_eye)
                      : Icon(Icons.visibility_off),
                ),
                border: OutlineInputBorder(),
                hintText: "Password",
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () { login(); }, child: Text("Login")),
        ],
      ),
    );
  }
}

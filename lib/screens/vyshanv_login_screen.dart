import 'package:api_integreation_beginner_2025/services/login_service.dart';
import 'package:flutter/material.dart';

class VyshanvLoginScreen extends StatefulWidget {
  const VyshanvLoginScreen({super.key});

  @override
  State<VyshanvLoginScreen> createState() => _VyshanvLoginScreenState();
}

class _VyshanvLoginScreenState extends State<VyshanvLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = true;

  void login() async{
    var req_data={
      "email": emailController.text,
      "password": passwordController.text
    };
    var response= await  LoginService.login(req_data);
    print(response);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar( SnackBar(content: Text(response["message"])));

  }
  @override
  Widget build(BuildContext context) {
    print("state is rendering once again");
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
              obscuringCharacter: "*",
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
          ElevatedButton(
            onPressed: () {
       login();
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}

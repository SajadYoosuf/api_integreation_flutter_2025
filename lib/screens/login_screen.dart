// import 'package:flutter/material.dart';
// import '../services/login_service.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   bool loading = false;
//
//   login() async {
//     setState(() => loading = true);
//
//     var response = await LoginService.login(
//       email: emailController.text,
//       password: passwordController.text,
//     );
//
//     setState(() => loading = false);
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(response["ASWIN"]),
//         backgroundColor:
//         response["success"] ? Colors.green : Colors.red,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               const Text(
//                 "Login",
//                 style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//               ),
//
//               const SizedBox(height: 30),
//
//               TextField(
//                 controller: emailController,
//                 decoration: const InputDecoration(
//                   labelText: "Email",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               const SizedBox(height: 15),
//
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: "Password",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               const SizedBox(height: 25),
//
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () async {
//                     await login();
//                   },
//                   child: loading
//                       ? const CircularProgressIndicator(color: Colors.white)
//                       : const Text("Login"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

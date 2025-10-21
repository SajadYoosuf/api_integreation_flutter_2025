import 'package:flutter/material.dart';

import '../services/student_services.dart';

class Adminloginscreen extends StatefulWidget {
  const Adminloginscreen({super.key});

  @override
  State<Adminloginscreen> createState() => _AdminloginscreenState();
}

class _AdminloginscreenState extends State<Adminloginscreen> {
  var _formKey = GlobalKey<FormState>();
  bool _isLoading=false;

  String? email;
  String? password;
  // Function to handle form submission
  // Future _submit() async {
  //   // Validate the form fields
  //   final isValid = _formKey.currentState!.validate();
  //   if (!isValid) {
  //     // If the form is not valid, return without doing anything
  //     return;
  //   } else {
  //     // If the form is valid, show a success message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text(
  //           "Successfully logged in",
  //           style: TextStyle(
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //
  //     );
  //     var payLoadData={
  //       "Email":email,
  //       "Password":password
  //     };
  //   var response= await GamificationService.adminLogin(payLoadData);
  //   if(!response.data.isEmpty){
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text(
  //           "${response.data}",
  //           style: TextStyle(
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //
  //     );
  //   }
  //   }
  //   // Save the form state
  //   _formKey.currentState!.save();
  // }

  Future<void> _login() async {

    var reqData = {
      "email": email,
      "password": password
    };
    try {
      var response = await LoginService.login(reqData);
      print('daaaaaaataaaaaa$response');

  if(response['message'].toString().isNotEmpty){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('${response['message']}'),
    ));
  }

    } catch (error) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error during login: $error'),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        key: _formKey,
        child: Column(

            children: <Widget>[
              Text(
                "Form-Validation In Flutter",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-Mail'),
                keyboardType: TextInputType.emailAddress,


                onChanged: (text) {
                  setState(() {
                    email = text;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,

                onChanged: (text) {
                  setState(() {
                    password = text;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.1,
              ),
              SizedBox(
                width: double.infinity, // Set the width to fill the parent
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.green),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onPressed: () => _login(),
                ),
              ),
            ]
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:api_integreation_beginner_2025/support/logger.dart';
import 'package:api_integreation_beginner_2025/services/employee_services.dart';
import 'package:flutter/material.dart';

class AllEmployeesScreen extends StatefulWidget {
  const AllEmployeesScreen({super.key});

  @override
  State<AllEmployeesScreen> createState() => _AllEmployeesScreenState();
}

class _AllEmployeesScreenState extends State<AllEmployeesScreen> {
  bool isLoading = true;
  bool isError = false;
  Map<String, dynamic>? employees;
  Future<void> getAllEmployees() async {
    try {
      final data = await EmployeeServices.getAllEmployees();

      setState(() {
        employees = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }

    log.i(employees);
  }

  load_inital_data() {
    Future.wait({getAllEmployees()});
  }

  @override
  void initState() {
    super.initState();
    // Schedule a callback to run after the first frame is rendered.

    load_inital_data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isError
          ? Center(
              child: Container(
                width: 30,
                height: 50,
                child: Text("employee loading getting error"),
              ),
            )
          : Center(
              child: ListView.builder(
                itemCount: employees!["data"]['employees'].length,
                itemBuilder: (context, index) {
                  return Text(
                    employees!['data']['employees'][index]['user']['firstName'],
                  );
                },
              ),
            ),
    );
  }
}

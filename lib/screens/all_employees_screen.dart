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

  @override
  void initState() {
    super.initState();
    // Schedule a callback to run after the first frame is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllEmployees();
    });
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
            child: Container(
                child: Column(
                  children: [
                    Text(employees!['data']['employees'][0]['user']['firstName']),
                  ],
                ),
              ),
          ),
    );
  }
}

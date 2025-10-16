import 'dart:convert';
import 'package:api_integreation_beginner_2025/support/logger.dart';
import 'package:api_integreation_beginner_2025/services/allora_services.dart';
import 'package:flutter/material.dart';

class AllemployeesScreen extends StatefulWidget {
  const AllemployeesScreen({super.key});

  @override
  State<AllemployeesScreen> createState() => _AllemployeesScreenState();
}

class _AllemployeesScreenState extends State<AllemployeesScreen> {
  bool _isLoading = true;
  var employees;
  Future<void> getAllemployees() async {

      final data = await AlloraServices.getAllEmployees();

      setState(() {
        employees = data;
      });


    log.i(employees);
  }

  @override
  void initState() {
    super.initState();
      _initLoad();
  }


  Future<void> _initLoad() async{
    Future.wait([getAllemployees()]);
      _isLoading=false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
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

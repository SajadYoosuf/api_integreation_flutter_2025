import 'dart:convert';
import 'package:api_integreation_beginner_2025/support/logger.dart';
import 'package:api_integreation_beginner_2025/services/allora_services.dart';
import 'package:flutter/material.dart';

import '../services/student_services.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  bool _isLoading = true;
 var students;

  Future<void> StudentDetails() async {

    final data = await StudentServices.StudentDetails();

    setState(() {
      students = data;

    });


    log.i(students);
  }

  @override
  void initState() {
    super.initState();
    _initLoad();

  }


  Future<void> _initLoad() async{
    Future.wait([StudentDetails()]);
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
              Text(students!['data']['studentList'][1]['Fullname']),
              Text(students!['data']['studentList'][1]['Guardian']),
            ],
          ),
        ),
      ),
    );
  }
}

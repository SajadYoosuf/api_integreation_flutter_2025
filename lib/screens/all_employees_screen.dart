import 'dart:convert';
import 'package:api_integreation_beginner_2025/support/logger.dart';
import 'package:api_integreation_beginner_2025/services/employee_services.dart';
import 'package:flutter/material.dart';

class AllclientsScreen extends StatefulWidget {
  const AllclientsScreen({super.key});

  @override
  State<AllclientsScreen> createState() => _AllclientsScreenState();
}

class _AllclientsScreenState extends State<AllclientsScreen> {
  bool _isLoading = true;
  var clients;
  Future<void> getAllClients() async {

      final data = await AlloraServices.getAllClients();

      setState(() {
        clients = data;
      });


    log.i(clients);
  }

  @override
  void initState() {
    super.initState();
      _initLoad();
  }
  Future<void> _initLoad() async{
    Future.wait([getAllClients()]);
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
                    Text(clients!['data']['clients'][0]['user']['firstName']),
                  ],
                ),
              ),
          ),
    );
  }
}

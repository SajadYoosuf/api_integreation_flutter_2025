import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Next extends StatefulWidget {
  const Next({super.key});

  @override
  State<Next> createState() => _NextState();
}

class _NextState extends State<Next> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [Text("OK")]));
  }
}

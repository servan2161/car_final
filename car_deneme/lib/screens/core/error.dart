import 'package:flutter/material.dart';

class error extends StatefulWidget {
  const error({super.key});

  @override
  State<error> createState() => _errorState();
}

class _errorState extends State<error> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("404 - NOT Found"),
      )),
    );
  }
}

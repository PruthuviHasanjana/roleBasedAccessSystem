import 'package:flutter/material.dart';

class Students extends StatelessWidget {
  static const routeName = 'students';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            'This screen can be accessed by Admin, Teachers and Students.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

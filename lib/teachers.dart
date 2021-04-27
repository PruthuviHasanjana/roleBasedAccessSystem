import 'package:flutter/material.dart';

class Teachers extends StatelessWidget {
  static const routeName = 'teachers';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teachers'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            'This screen can be accessed by only Admin and Teachers.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

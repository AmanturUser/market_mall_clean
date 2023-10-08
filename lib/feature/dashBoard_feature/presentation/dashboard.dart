import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
      body: Center(
        child: Text('DashBoard'),
      ),
    );
  }
}

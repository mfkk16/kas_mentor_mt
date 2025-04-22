import 'package:flutter/material.dart';

class UndefinedView extends StatelessWidget {
  final String? name;

  const UndefinedView({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Route for $name is not defined',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

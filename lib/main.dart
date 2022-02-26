
import 'package:code_challenge/screens/first_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(IGrooveCodeChallenge());
}

class IGrooveCodeChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstView(title: 'iGroove CodeChallenge'),
      debugShowCheckedModeBanner: false,
    );
  }
}

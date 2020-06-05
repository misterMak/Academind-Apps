import 'package:flutter/material.dart';
import 'package:academind_app2/home.dart';

void main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses App',
      home: Home(),
    );
  }
}

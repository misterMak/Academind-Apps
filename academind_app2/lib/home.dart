import 'package:academind_app2/transaction.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  List<Transaction> transactions = [
    Transaction(
      title: 'New Shoues',
      id: 1,
      amount: 32.22,
      time: DateTime.now(),
    ),
    Transaction(
      title: 'Groceries',
      id: 2,
      amount: 50.55,
      time: DateTime.now(),
    ),
    Transaction(
      title: 'New Jacket',
      id: 3,
      amount: 122.99,
      time: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses App'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

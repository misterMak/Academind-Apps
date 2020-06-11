import 'package:flutter/foundation.dart';

class Transaction {
  String title;
  int id;
  double amount;
  DateTime time;

  Transaction({
    @required this.title,
    @required this.id,
    @required this.amount,
    @required this.time,
  });
}

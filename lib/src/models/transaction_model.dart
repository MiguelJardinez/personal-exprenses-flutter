import 'package:flutter/foundation.dart';

class Transaction {
  String id;
  String title;
  double ammount;
  DateTime date;

  Transaction(
      {@required this.id,
      @required this.title,
      @required this.ammount,
      @required this.date});
}

import 'package:flutter/material.dart';

class Transaction{
  late String title;
  late String time;
  late String money;
  late String status;
  late String shortform;
  Transaction(this.title, this.time, this.money, this.status, this.shortform);
}

class ColorList{
  late Color color1;
  ColorList(this.color1);
}

final colors = [
  ColorList(Colors.red),
  ColorList(Colors.pink),
  ColorList(Colors.orange),
  ColorList(Colors.blue),
  ColorList(Colors.green),
  ColorList(Colors.pinkAccent),
  ColorList(Colors.red),
  ColorList(Colors.pink),
  ColorList(Colors.orange),
  ColorList(Colors.blue),
];

final transactions = [
  Transaction("Paid to Victoria", "1 day ago", "\$200", "SUCCESS", ""),
  Transaction("Mobile Recharges", "1 week ago", "\$45", "PENDING", "MR"),
  Transaction("Electricity Bill", "8 days ago", "\$200", "SUCCESS", "EB"),

  Transaction("Paid to Thomas", "2 week ago", "\$142", "FAILED", ""),
  Transaction("Paid to Eliza", "1 day ago", "\$200", "SUCCESS", ""),
  Transaction("Mobile Recharges", "1 week ago", "\$45", "PENDING", "MR"),

  Transaction("Paid to Victoria", "1 day ago", "\$200", "SUCCESS", ""),
  Transaction("Mobile Recharges", "1 week ago", "\$45", "PENDING", "MR"),
  Transaction("Electricity Bill", "8 days ago", "\$200", "SUCCESS", "EB"),

  Transaction("Paid to Thomas", "2 week ago", "\$142", "FAILED", ""),

];
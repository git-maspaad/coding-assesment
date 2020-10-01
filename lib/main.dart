import 'package:AIAGroup_CodingAssesment/applications/vendingMachine.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: '@git-maspaad',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VendingMachine(),
    );
  }
}
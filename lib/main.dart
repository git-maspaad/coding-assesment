import 'package:AIAGroup_CodingAssesment/applications/vendingMachine.dart';
import 'package:AIAGroup_CodingAssesment/sources/strings.dart';
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
        fontFamily: "${Strings.fontFamily}",
        primarySwatch: Colors.blue,
      ),
      home: VendingMachine(),
    );
  }
}
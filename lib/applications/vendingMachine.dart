import 'package:AIAGroup_CodingAssesment/sources/strings.dart';
import 'package:flutter/material.dart';

class VendingMachine extends StatefulWidget
{
  @override
  _VendingMachineState createState() => _VendingMachineState();
}

class _VendingMachineState extends State<VendingMachine>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        leading: SizedBox.shrink(),
        title: Text(
          "Vending Machine",
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontFamily: "${Strings.fontFamily}",
            fontSize: 18.0,
            fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.center,
        ),
        toolbarOpacity: 0.0,
      ),
      backgroundColor: Colors.red[900],
      body: Text("fewfw"),
    );
  }
}
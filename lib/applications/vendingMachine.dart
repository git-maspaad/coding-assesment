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
        toolbarOpacity: 1.0,
      ),
      backgroundColor: Colors.red[900],
      body: Text("fewfw"),
    );
  }
}
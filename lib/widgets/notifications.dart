import 'package:AIAGroup_CodingAssesment/sources/strings.dart';
import 'package:flutter/material.dart';

iSnackBar({@required GlobalKey<ScaffoldState> scaffoldState, @required String message})
{
  scaffoldState.currentState.showSnackBar(
    SnackBar(
      content: Padding(
        child: Text(
          message,
          style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontFamily: "${Strings.fontFamily}",
            fontSize: 14.0,
            fontWeight: FontWeight.w500
          ),
          textAlign: TextAlign.left,
        ),
        padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0, bottom: 10.0),
      ),
      duration: Duration(milliseconds: 1000),
    ),
  );
}
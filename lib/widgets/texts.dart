import 'package:AIAGroup_CodingAssesment/sources/strings.dart';
import 'package:flutter/material.dart';

Widget iText({
  @required BuildContext context,
  @required TextInputType keyboardType,
  @required TextInputAction keyboardAction,
  @required TextEditingController controller,
  @required TextAlign textAlign,
  @required bool isObscureText,
  @required bool isEnabled,
  @required double fontSize
}){
  return Theme(
    data: ThemeData(
      hintColor: Colors.grey,
      primaryColor: Colors.black,
      cursorColor: Colors.black
    ),
    child: Container(
      child: TextField(
        controller: controller,
        keyboardAppearance: Brightness.dark,
        
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "  . . . ",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: "${Strings.fontFamily}",
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
          ),

          labelStyle: TextStyle(
            color: Colors.black,
            fontFamily: "${Strings.fontFamily}",
            fontSize: 12.0,
            fontWeight: FontWeight.normal
          ),
        ),

        enabled: isEnabled,
        keyboardType: keyboardType,
        obscureText: isObscureText,
        textInputAction: keyboardAction,
        textAlign: textAlign,

        style: TextStyle(
          color: Colors.black,
          fontFamily: "${Strings.fontFamily}",
          fontSize: fontSize, // 12.0,
          fontWeight: FontWeight.normal,
        ),
      ),
      alignment: Alignment.center,
    ),
  );
}
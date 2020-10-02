import 'package:AIAGroup_CodingAssesment/sources/strings.dart';
import 'package:flutter/material.dart';

Widget appBarBack({
  @required Color iconColor, @required double iconSize,
  @required Function onTap
}){
  double size = 55.0;

  return Container(
    child: Material(
      child: InkWell(
        child: Container(
          child: Icon(
            Icons.arrow_back_ios,
            color: iconColor,
            size: iconSize,
          ),
          alignment: Alignment.center,
        ),
        onTap: onTap,
      ),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(size / 2.0),
        bottomRight: Radius.circular(size / 2.0)
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      elevation: 0.0,
    ),
  );
}

Widget iButton({
  @required BuildContext context,
  @required Color backgroundColor,
  @required String text, @required Color textColor,
  @required double fontSize, @required FontWeight fontWeight,
  @required Function onTap
}){
  double width = MediaQuery.of(context).size.width;
  double height = 60.0;

  return Material(
    child: InkWell(
      child: Container(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            decoration: TextDecoration.none,
            fontFamily: "${Strings.fontFamily}",
            fontSize: fontSize,
            fontWeight: fontWeight
          ),
          maxLines: 1,
          overflow: TextOverflow.fade,
          softWrap: false,
          textAlign: TextAlign.center,
        ),
        width: width,
        height: height,
        alignment: Alignment.center,
      ),
      onTap: onTap,
    ),
    clipBehavior: Clip.antiAlias,
    color: backgroundColor,
    elevation: 2.50,
  );
}
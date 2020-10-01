import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes
{
  static void defaultTheme()
  {
    // use this
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    
    // to hide only bottom bar:
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.top]);

    // to hide only status bar: 
    // SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);

    // to hide both:
    // SystemChrome.setEnabledSystemUIOverlays ([]);
  }
}
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:AIAGroup_CodingAssesment/applications/vendingMachine.dart';
import 'package:AIAGroup_CodingAssesment/sources/strings.dart';
import 'package:AIAGroup_CodingAssesment/widgets/themes.dart';

void main()
{
  Themes.defaultTheme();

  runZoned(()=> runApp(MyApp()), onError: (dynamic error, dynamic stack){
    print("");
    print("error -> $error");
    print("");
    print("stack -> $stack");
    print("");
  });

  // runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      checkerboardOffscreenLayers: false,
      checkerboardRasterCacheImages: false,
      debugShowCheckedModeBanner: true,
      debugShowMaterialGrid: false,
      darkTheme: ThemeData.light(),
      locale: Locale.cachedLocale,
      showPerformanceOverlay: false,
      showSemanticsDebugger: false,
      title: "${Strings.appName}",
      theme: ThemeData(
        fontFamily: "${Strings.fontFamily}",
        primaryColor: Colors.black,
        primaryColorDark: Colors.black,
        textSelectionColor: Colors.white,
      ),
      routes: <String, WidgetBuilder>
      {
        '/': (BuildContext context)=> VendingMachine(),
      },
    );
  }
}
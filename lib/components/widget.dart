import 'package:devquiz/splash/splash_page.dart';
import 'package:flutter/material.dart';

class Teste extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dev Quiz",
      home: Scaffold(
        body:SplashPage()
    ))
    ;
  }
}

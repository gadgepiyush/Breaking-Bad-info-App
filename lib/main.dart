import 'package:breakingbad/mainpage.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: MainPage(),
      theme: ThemeData.dark(),
    );
  }
}

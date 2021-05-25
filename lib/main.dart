import 'package:flutter/material.dart';
import 'package:restaurant/Authorization/continue_with_phone.dart';
import 'package:restaurant/MyHomePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(



        primarySwatch: Colors.blue,
      ),
      home: ContinueWithPhone(),
    );
  }
}

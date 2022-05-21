import 'package:flutter/material.dart';
import 'package:hello_flutter/src/login.dart';

void main() => runApp(CharaguaApp());


class CharaguaApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Charagua App',
      home: Login(),
    );
  }
}
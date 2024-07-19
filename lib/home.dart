// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_2/homescreen.dart'; // Updated import

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cooking App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/donatkentang.png'),
              Image.asset('assets/kuegarpu.png'),
              Image.asset('assets/waferkeju.png'),
              Image.asset('assets/putrisalju.png'),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const Home());

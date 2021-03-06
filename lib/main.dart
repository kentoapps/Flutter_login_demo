import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth.dart';
import 'root_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RootPage(auth: Auth()),
    );
  }
}



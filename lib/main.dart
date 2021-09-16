import 'package:flutter/material.dart';

import 'pages/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // primaryColor: Color(0x7A65FD),
        // accentColor: Color(0xB392FA),
      ),
      home: HomePage(),
    );
  }
}

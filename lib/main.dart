import 'package:flutter/material.dart';
import 'package:millionaire/models/inventories.dart';
import 'package:provider/provider.dart';

import 'pages/homePage.dart';
import 'pages/searchLottoPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Inventories(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          scaffoldBackgroundColor: Colors.purple[50]),
      home: SearchLottoPage(),
    );
  }
}

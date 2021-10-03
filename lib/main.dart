import 'package:flutter/material.dart';
import 'package:millionaire/alif/checkPage.dart';
import 'package:millionaire/alif/congratPage.dart';
import 'package:millionaire/alif/lottoNewsPage.dart';
import 'package:millionaire/alif/newsPage.dart';
import 'package:millionaire/alif/sorryPage.dart';
import 'package:millionaire/ice/component/screen/account/account.dart';
import 'package:millionaire/ice/component/screen/login/login.dart';
import 'package:millionaire/ice/component/screen/register/register.dart';
import 'package:millionaire/ing/homepage.dart';
import 'package:millionaire/ing/notiInput.dart';
import 'package:millionaire/ing/statistic.dart';
import 'package:millionaire/models/inventories.dart';
import 'package:millionaire/models/notiform.dart';
import 'package:millionaire/models/prize.dart';
import 'package:millionaire/models/usernameForm.dart';
import 'package:millionaire/nat/searchLottoPage.dart';
import 'package:provider/provider.dart';

import 'ing/notiListView.dart';
import 'kaew/account.dart';
import 'kaew/history.dart';
import 'models/bottomBarIndex.dart';
import 'nat/cartPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Inventories(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotiformModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => FirstFormModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => UsernameFormModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomBarIndex(),
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
          appBarTheme: AppBarTheme(
            color: Colors.deepPurple[200],
          ),
          fontFamily: 'Prompt',
          bottomAppBarColor: Colors.purple[200]),
      initialRoute: '/login',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomeScreen(),
        '/acc': (context) => Account(),
        '/his': (context) => History(),
        '/sta': (context) => Statistic(),
        '/lotto-news': (context) => LottoNewsPage(),
        '/news': (context) => NewsPage(),
        '/check': (context) => CheckPage(),
        '/congrat': (context) => CongratPage(),
        '/sorry': (context) => SorryPage(),
        '/noti': (context) => Listviewtest(),
        '/input': (context) => Notiinput(),
        '/search': (context) => SearchLottoPage(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(),
        '/profile': (context) => ProfileScreen(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {},
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              if (context.read<BottomBarIndex>().bottomBarIndex != 0) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
                setState(() {
                  context.read<BottomBarIndex>().bottomBarIndex = 0;
                });
              }
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                  ],
                ),
              ],
            ),
          ),
          label: 'หน้าหลัก',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              setState(() {
                context.read<BottomBarIndex>().bottomBarIndex = 1;
              });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchLottoPage()));
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.search),
                  ],
                ),
              ],
            ),
          ),
          label: 'ค้นหาเลข',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/check');
              setState(() {
                context.read<BottomBarIndex>().bottomBarIndex = 2;
              });
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.money),
                  ],
                ),
              ],
            ),
          ),
          label: 'ตรวจรางวัล',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/noti');
              setState(() {
                context.read<BottomBarIndex>().bottomBarIndex = 3;
              });
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.notifications),
                  ],
                ),
              ],
            ),
          ),
          label: 'การแจ้งเตือน',
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, '/acc');
                context.read<BottomBarIndex>().bottomBarIndex = 4;
              });
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person),
                  ],
                ),
              ],
            ),
          ),
          label: 'บัญชีของฉัน',
        ),
      ],
      currentIndex: context.read<BottomBarIndex>().bottomBarIndex,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:happy_second/routes/account.dart';
import 'package:happy_second/routes/cart.dart';
import 'package:happy_second/routes/home.dart';
import 'package:happy_second/routes/search.dart';
import 'package:happy_second/utils/hexColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  final _pageRouting = const <Widget>[
    HomePage(),
    SearchPage(),
    CartPage(),
    AccountPage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            title: const Image(
                width: 70,
                height: 70,
                image: AssetImage("lib/assets/logo.jpg")),
            backgroundColor: Colors.white,
            actions: const <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: CircleAvatar(
                    child: Icon(Icons.person, color: Colors.white),
                    backgroundColor: Colors.grey,
                  ))
            ]),
        body: _pageRouting[index],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: HexColor.fromHex("#5E7737"),
          unselectedItemColor: Colors.grey[400],
          currentIndex: index,
          onTap: (x) {
            setState(() {
              index = x;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
            ),
          ],
        ));
  }
}

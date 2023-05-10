import 'package:flutter/material.dart';
import 'package:happy_second/routes/account.dart';
import 'package:happy_second/routes/cart.dart';
import 'package:happy_second/routes/filter.dart';
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
    return MaterialApp(
      theme: ThemeData(
          textSelectionTheme: TextSelectionThemeData( cursorColor: HexColor.fromHex("#5E7737"))

      ),
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
  static final TextEditingController _searchController = TextEditingController();

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
    final _title = <Widget>[
      const Image(
          width: 70, height: 70, image: AssetImage("lib/assets/logo.jpg")),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200]
        ),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(Icons.search, color: HexColor.fromHex("#5E7737")),
            border: InputBorder.none,
            focusColor: HexColor.fromHex("#5E7737"),
            iconColor: HexColor.fromHex("#5E7737"),
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      Text("Cart",
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: HexColor.fromHex("#5E7737"))),
      const SizedBox()
    ];

    final _action = <Widget>[
      const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(Icons.person, color: Colors.white),
          )),
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: IconButton(
            iconSize: 30,
            icon: Icon(Icons.list, color: HexColor.fromHex("#5E7737")),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Filter(),
                  )
              );
            },
          )),
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: IconButton(
            iconSize: 30,
            icon: Icon(Icons.delete, color: HexColor.fromHex("#5E7737")),
            onPressed: () {
              print("Delete all");
            },
          )),
      const SizedBox()
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: index == 3 ? 0.0 : 2.0,
            centerTitle: true,
            title: _title[index],
            backgroundColor: Colors.white,
            actions: [_action[index]]),
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
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.grey[200],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.grey[200],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: Colors.grey[200],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
              backgroundColor: Colors.grey[200],
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:happy_second/routes/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Home Logo")
                ],
              ),
              actions: const <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0), child: CircleAvatar())
              ]),
          body: const HomePage(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.green),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.green),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: Colors.green),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.green),
                label: 'Account',
              ),
            ],
          )),
    );
  }
}

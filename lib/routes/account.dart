import 'package:flutter/material.dart';
import 'package:happy_second/utils/storage/sharedPreferences_util.dart';

import '../utils/hexColor.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listItem = <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 10,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: HexColor.fromHex("#5E7737")),
        )
      ]),
      SizedBox(height: 20),
      Card(
        child: ListTile(
          leading: Icon(Icons.person, color: HexColor.fromHex("#5E7737")),
          title: Text(
            "Personal Details",
            style: TextStyle(
                color: HexColor.fromHex("#5E7737"),
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            print("hello person");
          },
        ),
      ),
      SizedBox(height: 4),
      Card(
        child: ListTile(
          leading: Icon(Icons.upload, color: HexColor.fromHex("#5E7737")),
          title: Text(
            "Become Sellers",
            style: TextStyle(
                color: HexColor.fromHex("#5E7737"),
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            print("hello sellers");
          },
        ),
      ),
      SizedBox(height: 4),
      Card(
          child: ListTile(
        leading: Icon(Icons.history, color: HexColor.fromHex("#5E7737")),
        title: Text(
          "My Order",
          style: TextStyle(
              color: HexColor.fromHex("#5E7737"), fontWeight: FontWeight.bold),
        ),
        onTap: () {
          print("hello order");
        },
      )),
      SizedBox(height: 4),
      Card(
          child: ListTile(
        leading:
            Icon(Icons.credit_card_sharp, color: HexColor.fromHex("#5E7737")),
        title: Text(
          "My Cards",
          style: TextStyle(
              color: HexColor.fromHex("#5E7737"), fontWeight: FontWeight.bold),
        ),
        onTap: () {
          print("hello cards");
        },
      )),
      SizedBox(height: 4),
      Card(
          child: ListTile(
        leading: Icon(Icons.logout, color: HexColor.fromHex("#5E7737")),
        title: Text(
          "Log out",
          style: TextStyle(
              color: HexColor.fromHex("#5E7737"), fontWeight: FontWeight.bold),
        ),
        onTap: () {
          SharedPreferencesUtil.preferences.remove("email");
          SharedPreferencesUtil.preferences.remove("password");
          Navigator.pushNamed(context, "/");
        },
      ))
    ];
    return Column(
      children: [
        const Center(
            child: CircleAvatar(
          backgroundImage: AssetImage('lib/assets/wangzainiunai.jpeg'),
          radius: 80, // set the radius as needed
        )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Center(
              child: Text(
            "Wangzainiunai",
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: HexColor.fromHex("#5E7737")), // set the radius as needed
          )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 2, 0, 70),
          child: Center(
              child: Text(
            "wangwang@gamil.com",
            style: TextStyle(
                fontSize: 16.0,
                color: HexColor.fromHex("#5E7737")), // set the radius as needed
          )),
        ),
        Expanded(
            child: Container(
          color: Colors.grey[300],
          child: Padding(
              padding: EdgeInsets.all(30),
              child: ListView(
                children: listItem,
              )),
        ))
      ],
    );
  }
}

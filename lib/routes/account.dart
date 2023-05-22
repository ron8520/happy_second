import 'package:flutter/material.dart';
import 'package:happy_second/model/user.dart';
import 'package:happy_second/utils/storage/sharedPreferences_util.dart';
import 'package:provider/provider.dart';

import '../states/app.dart';
import '../utils/hexColor.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

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
    final app = Provider.of<AppModel>(context, listen: true);
    final user = app.currentUser;

    final listItem = <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: HexColor.fromHex("#5E7737"),
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Card(
        child: ListTile(
          leading: Icon(Icons.person, color: HexColor.fromHex("#5E7737")),
          title: Text(
            "Personal Details",
            style: TextStyle(
              color: HexColor.fromHex("#5E7737"),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/personalDetail');
          },
        ),
      ),
      const SizedBox(height: 4),
      Card(
        child: ListTile(
          leading: Icon(Icons.upload, color: HexColor.fromHex("#5E7737")),
          title: Text(
            "Become Sellers",
            style: TextStyle(
              color: HexColor.fromHex("#5E7737"),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            if (user?.usertype != UserType.seller) {
              Navigator.pushNamed(context, '/becomeSeller');
            } else {
              Navigator.pushNamed(context, '/uploadItem');
            }
          },
        ),
      ),
      const SizedBox(height: 4),
      if (user?.usertype == UserType.seller)
        Card(
          child: ListTile(
            leading: Icon(Icons.upload, color: HexColor.fromHex("#5E7737")),
            title: Text(
              "Upload Item",
              style: TextStyle(
                color: HexColor.fromHex("#5E7737"),
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/uploadItem');
            },
          ),
        ),
      const SizedBox(height: 4),
      Card(
        child: ListTile(
          leading: Icon(Icons.history, color: HexColor.fromHex("#5E7737")),
          title: Text(
            "My Order",
            style: TextStyle(
              color: HexColor.fromHex("#5E7737"),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/myorders');
          },
        ),
      ),
      const SizedBox(height: 4),
      Card(
        child: ListTile(
          leading: Icon(Icons.credit_card_sharp, color: HexColor.fromHex("#5E7737")),
          title: Text(
            "My Cards",
            style: TextStyle(
              color: HexColor.fromHex("#5E7737"),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/mycards');
          },
        ),
      ),
      const SizedBox(height: 4),
      Card(
        child: ListTile(
          leading: Icon(Icons.logout, color: HexColor.fromHex("#5E7737")),
          title: Text(
            "Log out",
            style: TextStyle(
              color: HexColor.fromHex("#5E7737"),
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            SharedPreferencesUtil.preferences.remove("userId");
            app.currentUser = null;
            Navigator.pushReplacementNamed(context, "/");
          },
        ),
      ),
    ];
    return Column(
      children: [
        const Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('lib/assets/wangzainiunai.jpeg'),
            radius: 80, // set the radius as needed
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Center(
            child: Text(
              user?.username ?? '',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: HexColor.fromHex("#5E7737"),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 2, 0, 20),
          child: Center(
            child: Text(
              user?.emailAddress ?? '',
              style: TextStyle(
                fontSize: 16.0,
                color: HexColor.fromHex("#5E7737"),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ListView(
                children: listItem,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
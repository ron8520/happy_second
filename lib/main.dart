import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:happy_second/componets/checkout/paymentSuccess.dart';
import 'package:happy_second/routes/account.dart';
import 'package:happy_second/routes/becomeseller.dart';
import 'package:happy_second/routes/cart.dart';
import 'package:happy_second/routes/home.dart';
import 'package:happy_second/routes/login.dart';
import 'package:happy_second/routes/myCard.dart';
import 'package:happy_second/routes/myorder.dart';
import 'package:happy_second/routes/personalDetail.dart';
import 'package:happy_second/routes/searchView.dart';
import 'package:happy_second/routes/uploadItem.dart';
import 'package:happy_second/routes/searchView.dart';
import 'package:happy_second/states/app.dart';
import 'package:happy_second/states/search.dart';
import 'package:happy_second/utils/hexColor.dart';
import 'package:happy_second/utils/storage/sharedPreferences_util.dart';
import 'package:provider/provider.dart';

import 'database/db.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  realRunApp();
}

void realRunApp() async {
  await SharedPreferencesUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String? userId = SharedPreferencesUtil.preferences.getString("userId");
    return MultiProvider(
        providers: [
          Provider<AppDatabase>(
            create: (context) => AppDatabase(),
            dispose: (context, db) => db.close(),
          ),
          ChangeNotifierProvider(create: (context) => AppModel(userId: userId)),
          ChangeNotifierProvider(create: (context) => SearchModel())
        ],
        child: MaterialApp(
            routes: {
              '/login': (context) => LoginPage(),
              '/paymentSuccess': (context) => PaymentSuccessPage(),
              '/becomeSeller': (context) => SubscribePage(),
              '/uploadItem': (context) => UploadProductPage(),
              '/myorders': (context) => OrderHistoryPage(),
              '/mycards': (context) => CardPage(),
              '/personalDetail': (context) => PersonalDetailPage()
            },
            builder: EasyLoading.init(),
            theme: ThemeData(
                textSelectionTheme: TextSelectionThemeData(
                    cursorColor: HexColor.fromHex("#5E7737"))),
            debugShowCheckedModeBanner: false,
            home: MainPage()));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  Widget? callPage() {
    if (index == 0) {
      return const HomePage();
    } else if (index == 1) {
      return const SearchPage();
    } else if (index == 2) {
      return const CartPage();
    } else if (index == 3) {
      return const AccountPage();
    } else {
      return const HomePage();
    }
  }

  @override
  void initState() {
    fetchUserInfo();
    fetchAllProducts();
    super.initState();
  }

  Future<void> fetchUserInfo() async {
    final app = Provider.of<AppModel>(context, listen: false);
    await app.fetchUserDetails(context);
  }

  Future<void> fetchAllProducts() async {
    final search = Provider.of<SearchModel>(context, listen: false);
    await search.fetchAllProducts(context);
  }

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<SearchModel>(context, listen: true);
    final user = Provider.of<AppModel>(context, listen: true).currentUser;

    final _title = <Widget>[
      const Image(
          width: 70, height: 70, image: AssetImage("lib/assets/logo.jpg")),
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.grey[200]),
        child: TextField(
          controller: search.searchController,
          onChanged: (value) async {
            // Implement logic to update search results based on the input.
            await search.searchProducts(context, value);
          },
          decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(Icons.search, color: HexColor.fromHex("#5E7737")),
            border: InputBorder.none,
            focusColor: HexColor.fromHex("#5E7737"),
            iconColor: HexColor.fromHex("#5E7737"),
            hintStyle: const TextStyle(color: Colors.grey),
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
       Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: user != null ?
              const CircleAvatar(
                backgroundImage: AssetImage('lib/assets/wangzainiunai.jpeg'),
              ) :
          const CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(Icons.person, color: Colors.white),
          )),
      const SizedBox(),
      user != null && user.cart!.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                iconSize: 30,
                icon: Icon(Icons.delete, color: HexColor.fromHex("#5E7737")),
                onPressed: () async {
                  final app = Provider.of<AppModel>(context, listen: false);
                  await app.removeAllCartItems(context);
                  EasyLoading.showSuccess("Remove all items successfully!");
                },
              ))
          : const SizedBox(),
      const SizedBox()
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: index == 3 ? 0.0 : 2.0,
            centerTitle: true,
            title: _title[index],
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            actions: [_action[index]]),
        body: callPage(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: HexColor.fromHex("#5E7737"),
          unselectedItemColor: Colors.grey[400],
          currentIndex: index,
          onTap: (x) {
            if (x == 2 || x == 3) {
              if (SharedPreferencesUtil.preferences.getString("userId") ==
                  null) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ));
              } else {
                setState(() {
                  index = x;
                });
              }
            } else {
              setState(() {
                index = x;
              });
            }
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.grey[200],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.grey[200],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: 'Cart',
              backgroundColor: Colors.grey[200],
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Account',
              backgroundColor: Colors.grey[200],
            ),
          ],
        ));
  }
}

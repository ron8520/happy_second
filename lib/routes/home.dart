import 'package:flutter/material.dart';
import 'package:happy_second/utils/hexColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: const [
                      Image(image: AssetImage("lib/assets/banner3.png")),
                      Image(image: AssetImage("lib/assets/banner2.png")),
                      Image(image: AssetImage("lib/assets/banner1.png"))
                    ],
                  )),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 3; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: _currentPage == i ? 20 : 10,
                decoration: BoxDecoration(
                  shape:
                      _currentPage == i ? BoxShape.rectangle : BoxShape.circle,
                  color: _currentPage == i
                      ? HexColor.fromHex("#5E7737")
                      : Colors.grey,
                  borderRadius:
                      _currentPage == i ? BorderRadius.circular(20.0) : null,
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 180,
                width: 180,
                child: Text("Toys"),
                decoration: BoxDecoration(
                  color: HexColor.fromHex("#F4D2B1"),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              Container(
                height: 180,
                width: 180,
                child: Text("Clothes"),
                decoration: BoxDecoration(
                  color: HexColor.fromHex("#9BBBFF"),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 200,
        )
      ],
    );
  }
}

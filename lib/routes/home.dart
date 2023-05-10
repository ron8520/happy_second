import 'package:flutter/material.dart';
import 'package:happy_second/componets/product_card.dart';
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

  final items = [
    ProductCard(),
    ProductCard(),
    ProductCard(),
    ProductCard(),
    ProductCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
            height:
                MediaQuery.of(context).size.height * 0.2, // Set a fixed height
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
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
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Category",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: HexColor.fromHex("#5E7737")),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print("go to toys");
                },
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: HexColor.fromHex("#F4D2B1"),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: const [
                      Positioned(
                          top: 0.0,
                          left: 0.0,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Image(
                                  height: 140,
                                  width: 140,
                                  image: AssetImage("lib/assets/duck.png")),
                            ),
                          )),
                      Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Text(
                                'Toys',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () {
                    print("Go to Clothes");
                  },
                  child: Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      color: HexColor.fromHex("#9BBBFF"),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Stack(
                      children: const [
                        Positioned(
                            top: 0.0,
                            left: 0.0,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Image(
                                    height: 140,
                                    width: 160,
                                    image:
                                        AssetImage("lib/assets/clothes.png")),
                              ),
                            )),
                        Positioned(
                            bottom: 0.0,
                            right: 0.0,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text(
                                  'Clothes',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Newest Products",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: HexColor.fromHex("#5E7737")),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of items per row
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.8
            ),
            itemBuilder: (BuildContext context, int index) {
              return items[index];
            },
          )
        )
      ],
    ));
  }
}

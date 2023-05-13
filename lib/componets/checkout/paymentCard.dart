import 'package:flutter/material.dart';
import 'package:happy_second/utils/hexColor.dart';

class HorizontalSwipeCard extends StatefulWidget {
  @override
  _HorizontalSwipeCardState createState() => _HorizontalSwipeCardState();
}

class _HorizontalSwipeCardState extends State<HorizontalSwipeCard> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _cards = [
    Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: HexColor.fromHex('#8DBA37'),
        ),
        child: const ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('Card 1'),
          subtitle: Text('Card 1 subtitle'),
        ),
      ),
    ),
    Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: HexColor.fromHex('#7D7D7D'),
          ),
          child: ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Card 2'),
            subtitle: Text('Card 2 subtitle'),
          ),
        )),
    Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: HexColor.fromHex('#9BBBFF'),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    width: 70,
                    height: 70,
                    image: AssetImage("lib/assets/bank/westpac.png"),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("EXPIRED", style: TextStyle(color: Colors.white)),
                        Text("01/26", style: TextStyle(color: Colors.white))
                      ])
                ],
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "1234 5678 9232 0921",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Card Holder",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Wangzainiunai",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Image(
                    width: 80,
                    height: 80,
                    image: AssetImage("lib/assets/bank/Mastercard.png"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (BuildContext context, int index) {
                return _cards[index % _cards.length];
              },
              itemCount: _cards.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _cards.map((card) {
                int index = _cards.indexOf(card);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index
                        ? HexColor.fromHex("#5E7737")
                        : Colors.grey.withOpacity(0.5),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

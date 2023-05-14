import 'package:flutter/material.dart';
import 'package:happy_second/componets/checkout/paymentCard.dart';
import 'package:happy_second/utils/hexColor.dart';

import '../../model/user.dart';


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

  final _cards = [
    PaymentCard(number: "1234 5678 9012 1233", cardHolder: "Wangzainiunai"),
    PaymentCard(number: "1234 5678 9012 3211", cardHolder: "Wangzainiunai"),
    PaymentCard(number: "1234 5678 9012 3333", cardHolder: "Wangzainiunai"),
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
                return  PaymentCardView(paymentCard: _cards[index % _cards.length]);
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
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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

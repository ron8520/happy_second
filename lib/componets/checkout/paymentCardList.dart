import 'package:flutter/material.dart';
import 'package:happy_second/componets/checkout/paymentCard.dart';
import 'package:happy_second/utils/hexColor.dart';
import 'package:provider/provider.dart';

import '../../model/user.dart';
import '../../states/app.dart';
import '../dialog/addCard.dart';

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

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppModel>(context, listen: true).currentUser!;

    return SizedBox(
      height: 240,
      width: double.infinity,
      child: user.cards!.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Card is Empty, press the button to add new card",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddCardDialog();
                          });
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemBuilder: (BuildContext context, int index) {
                      return PaymentCardView(
                          paymentCard: user.cards![index % user.cards!.length]);
                    },
                    itemCount: user.cards!.length,
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
                    children: user.cards!.map((card) {
                      int index = user.cards!.indexOf(card);
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

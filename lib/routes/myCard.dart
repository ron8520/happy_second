import 'package:flutter/material.dart';

import '../componets/checkout/paymentCard.dart';
import '../model/user.dart';
import '../utils/hexColor.dart';

class CardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool _selectionMode = false;

  final _cards = [
    PaymentCard(number: "1234 5678 9012 1233", cardHolder: "Wangzainiunai"),
    PaymentCard(number: "1234 5678 9012 3211", cardHolder: "Wangzainiunai"),
    PaymentCard(number: "1234 5678 9012 3333", cardHolder: "Wangzainiunai"),
  ];

  final List<Widget> cardView = [

  ];

  void _toggleSelectionMode() {
    setState(() {
      _selectionMode = !_selectionMode;
      // Deselect all cards when exiting selection mode
      if (!_selectionMode) {
        _cards.forEach((card) => card.selected = false);
      }
    });
  }

  void _deleteSelectedCards() {
    setState(() {
      _cards.removeWhere((card) => card.selected);
      _selectionMode = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Card",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: HexColor.fromHex("#5E7737"),
        actions: [
          _selectionMode
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: _deleteSelectedCards,
                )
              : IconButton(
                  icon: Icon(Icons.list), onPressed: _toggleSelectionMode)
        ],
      ),
      body: ListView.builder(
        itemCount: _cards.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                _selectionMode
                    ? Checkbox(
                        shape: const CircleBorder(),
                        activeColor: HexColor.fromHex("#5E7737"),
                        value: _cards[index].selected,
                        onChanged: (value) {
                          setState(() {
                            _cards[index].selected = value!;
                          });
                        },
                      )
                    : SizedBox.shrink(),
                Expanded(child: PaymentCardView(paymentCard: _cards[index]))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleSelectionMode,
        backgroundColor: HexColor.fromHex("#5E7737"),
        child: const Icon(Icons.add),
      ),
    );
  }
}

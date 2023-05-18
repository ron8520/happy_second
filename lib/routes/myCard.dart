import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../componets/checkout/paymentCard.dart';
import '../componets/dialog/addCard.dart';
import '../model/user.dart';
import '../states/app.dart';
import '../utils/hexColor.dart';

class CardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  bool _selectionMode = false;

  void _toggleSelectionMode() {
    final user = Provider.of<AppModel>(context, listen: false).currentUser!;

    setState(() {
      _selectionMode = !_selectionMode;
      // Deselect all cards when exiting selection mode
      if (!_selectionMode) {
        for (var card in user.cards!) {
          card.selected = false;
        }
      }
    });
  }

  Future<void> _deleteSelectedCards() async {
    final app = Provider.of<AppModel>(context, listen: false);
    await app.removeCard(context);
    setState(() {
      _selectionMode = false;
    });
  }

  void addNewCardDialog() async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AddCardDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppModel>(context, listen: true).currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Card",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: HexColor.fromHex("#5E7737"),
        actions: [
          user.cards!.isEmpty
              ? const SizedBox()
              : _selectionMode
                  ? IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: _deleteSelectedCards,
                    )
                  : IconButton(
                      icon: Icon(Icons.list), onPressed: _toggleSelectionMode)
        ],
      ),
      body: user.cards!.isEmpty
          ? const Center(
              child: Text("Cards is Empty",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)))
          : ListView.builder(
              itemCount: user.cards!.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      _selectionMode
                          ? Checkbox(
                              shape: const CircleBorder(),
                              activeColor: HexColor.fromHex("#5E7737"),
                              value: user.cards![index].selected,
                              onChanged: (value) {
                                setState(() {
                                  user.cards![index].selected = value!;
                                });
                              },
                            )
                          : const SizedBox.shrink(),
                      Expanded(
                          child:
                              PaymentCardView(paymentCard: user.cards![index]))
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewCardDialog,
        backgroundColor: HexColor.fromHex("#5E7737"),
        child: const Icon(Icons.add),
      ),
    );
  }
}

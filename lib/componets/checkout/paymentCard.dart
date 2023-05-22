import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/user.dart';
import '../../utils/hexColor.dart';

class PaymentCardView extends StatefulWidget {
  PaymentCard paymentCard;

  PaymentCardView({required this.paymentCard});

  @override
  State<StatefulWidget> createState() => _PaymentCardViewState();
}

class _PaymentCardViewState extends State<PaymentCardView> {

  late Color backgroundColor;

  @override
  void initState(){
    Random random = Random();
    backgroundColor = colors[random.nextInt(colors.length)];
    super.initState();
  }


  final colors = [
    HexColor.fromHex('#8DBA37'),
    HexColor.fromHex('#7D7D7D'),
    HexColor.fromHex('#9BBBFF')
  ];

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('MM/yyyy');

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: backgroundColor,
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
                      children:  [
                        const Text("EXPIRED", style: TextStyle(color: Colors.white)),
                        Text(dateFormat.format(widget.paymentCard.expiryDate), style: TextStyle(color: Colors.white))
                      ])
                ],
              ),
              const SizedBox(height: 30),
               Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.paymentCard.number}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Card Holder",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${widget.paymentCard.cardHolder}",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
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
    );
  }
}

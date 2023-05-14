import 'package:flutter/material.dart';

import '../../utils/hexColor.dart';

class PaymentCardView extends StatefulWidget{
  Color backgroundColor;

  PaymentCardView({required this.backgroundColor});

  @override
  State<StatefulWidget> createState () => _PaymentCardViewState();

}

class _PaymentCardViewState extends State<PaymentCardView>{
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.backgroundColor,
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
    );
  }
}
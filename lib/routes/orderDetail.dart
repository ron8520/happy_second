import 'package:flutter/material.dart';
import 'package:happy_second/componets/history/historyCard.dart';
import 'package:happy_second/utils/hexColor.dart';
import 'myorder.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;

  OrderDetailPage({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tracking Order",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: HexColor.fromHex("#5E7737"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Order ID: ${order.id}\nDate: ${order.date}\nTotal: ${order.total}\nStatus: ${order.status}', style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
  }
}
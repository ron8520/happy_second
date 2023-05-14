import 'package:flutter/material.dart';
import 'package:happy_second/componets/history/historyCard.dart';

import '../utils/hexColor.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  List<Order> _orders = [
    Order(id: '#123465723212311231', date: '2023-05-10 at 17:30', total: 25.99, status: "Processing"),
    Order(id: '#123465723212311231', date: '2023-05-08 at 17:30', total: 19.99, status: "Pending"),
    Order(id: '#123465723212311231', date: '2023-05-05 at 17:30', total: 42.99, status: "Delivered"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Order History',
              style: TextStyle(
                  color: HexColor.fromHex("#5E7737"),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0)),
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(94, 119, 55, 1),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: _orders.length,
            itemBuilder: (context, index) {
              Order order = _orders[index];
              return HistoryCard(order: order);
            },
          ),
        ));
  }
}

class Order {
  final String id;
  final String date;
  final double total;
  final String status;

  Order({required this.status, required this.id, required this.date, required this.total});
}

import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  List<Order> _orders = [
    Order(id: '1', date: '2023-05-10', total: 25.99),
    Order(id: '2', date: '2023-05-08', total: 19.99),
    Order(id: '3', date: '2023-05-05', total: 42.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order History', style: TextStyle(color: Color.fromRGBO(94, 119, 55, 1)),),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(94, 119, 55, 1),
        ),
      ),
      body: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          Order order = _orders[index];
          return ListTile(
            title: Text('Order ID: ${order.id}'),
            subtitle: Text('Date: ${order.date}'),
            trailing: Text('\$${order.total.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}

class Order {
  final String id;
  final String date;
  final double total;

  Order({required this.id, required this.date, required this.total});
}

void main() {
  runApp(MaterialApp(
    home: OrderHistoryPage(),
  ));
}
import 'package:flutter/material.dart';
import 'package:happy_second/componets/history/historyCard.dart';
import 'package:happy_second/routes/orderDetail.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../database/db.dart';
import '../model/order.dart';
import '../model/product.dart';
import '../utils/hexColor.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  List<Order> orders = [];

  @override
  void initState() {
    super.initState();
    initOrders();
  }

  Future<List<Product>?> fetchProducts() async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    final productList = await db.findProducts();
    return productList;
  }

  Future<void> initOrders() async {
    final productList = await fetchProducts();
    setState(() {
      orders = [
        Order(
          uuid: const Uuid().v4(),
          date: DateTime.now().toString(),
          total: 250.00,
          status: OrderStatus.pending,
          items: productList
                  ?.where((item) => item.category == Category.clothes)
                  .toList() ??
              [],
        ),
        Order(
          uuid: const Uuid().v4(),
          date: DateTime.now().toString(),
          total: 150.00,
          status: OrderStatus.processing,
          items: productList
                  ?.where((item) => item.category == Category.toys)
                  .toList() ??
              [],
        ),
        Order(
          uuid: const Uuid().v4(),
          date: DateTime.now().toString(),
          total: 250.00,
          status: OrderStatus.delivered,
          items: productList
                  ?.where((item) =>
                      item.category == Category.toys &&
                      item.subCategory == SubCategory.plastic)
                  .toList() ??
              [],
        ),
      ];
    });
  }

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
            itemCount: orders.length,
            itemBuilder: (context, index) {
              Order order = orders[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderDetailPage(order: order, index: index,)),
                  );
                },
                child: HistoryCard(order: order),
              );
            },
          ),
        ));
  }
}

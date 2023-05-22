import 'package:happy_second/model/product.dart';

class Order {
  final String uuid;
  final String date;
  final double total;
  final OrderStatus status;
  final List<Product> items;

  Order(
      {required this.status,
      required this.uuid,
      required this.date,
      required this.total,
      required this.items});
}

enum OrderStatus { pending, processing, delivered }

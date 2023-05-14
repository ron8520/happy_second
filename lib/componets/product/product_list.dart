import 'package:flutter/material.dart';
import 'package:happy_second/componets/product/product_card.dart';

class ProductList extends StatefulWidget{
  const ProductList({super.key});

  @override
  State<StatefulWidget> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final items = [
    ProductCard(),
    ProductCard(),
    ProductCard(),
    ProductCard(),
    ProductCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of items per row
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8
      ),
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
  }

}
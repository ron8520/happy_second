import 'package:flutter/material.dart';
import 'package:happy_second/componets/product/product_card.dart';
import 'package:happy_second/database/db.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../../states/app.dart';

class ProductList extends StatefulWidget {
  Category? category;
  SubCategory? subCategory;

  ProductList({super.key, this.category, this.subCategory});

  @override
  State<StatefulWidget> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final items = Provider.of<AppModel>(context, listen: true).items;
    return items.isEmpty
        ? const Center(
            child: Text("No items"),
          )
        : GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of items per row
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.8),
            itemBuilder: (BuildContext context, int index) {
              return ProductCard(product: items[index]);
            },
          );
  }
}

import 'package:flutter/material.dart';
import 'package:happy_second/states/search.dart';
import 'package:provider/provider.dart';

import '../componets/product/product_card.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<SearchModel>(context, listen: true);

    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: [
          search.searchItems.isEmpty
              ? const Center(
                  child: Text("No items"),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: search.searchItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of items per row
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.8),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(product: search.searchItems[index]);
                  },
                )
        ],
      ),
    ));
  }
}

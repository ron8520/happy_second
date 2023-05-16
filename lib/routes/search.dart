import 'package:flutter/material.dart';

import '../componets/product/product_list.dart';

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
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Column(
        children: const [
          ProductList()
        ],
      ),
    ));
  }
}

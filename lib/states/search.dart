import 'package:flutter/material.dart';
import 'package:happy_second/database/db.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';

class SearchModel extends ChangeNotifier {

  final TextEditingController searchController = TextEditingController();
  List<Product> searchItems = [];
  List<Product> allItems = [];

  SearchModel();

  Future<void> fetchAllProducts(BuildContext context) async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    allItems = (await db.findProducts()) ?? [];
    searchItems = allItems;
    notifyListeners();
  }

  Future<void> searchProducts(BuildContext context, String value) async {
    if(value == '' || value.isEmpty){
      searchItems = allItems;
    }else{
      searchItems = allItems.where((item) {
        return item.name.toLowerCase().contains(value.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
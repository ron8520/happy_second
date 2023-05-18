import 'package:flutter/material.dart';
import 'package:happy_second/componets/product/product_list.dart';
import 'package:happy_second/utils/hexColor.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:provider/provider.dart';

import '../componets/product/product_card.dart';
import '../database/db.dart';
import '../model/product.dart';

class CategoryPage extends StatefulWidget {
  final String title;

  const CategoryPage({super.key, required this.title});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  SubCategory currentSelected = SubCategory.all;
  List<Product> items = [];

  final toysCategory = [
    SubCategory.all,
    SubCategory.plastic,
    SubCategory.plush,
    SubCategory.wooden
  ];

  final clothesCategory = [
    SubCategory.all,
    SubCategory.women,
    SubCategory.men,
    SubCategory.children
  ];

  @override
  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  Future<void> fetchProducts() async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    final allProductLists = await db.findProducts();
    final category = widget.title == "Clothes" ? Category.clothes : Category.toys;
    var productList = allProductLists?.where((item) => item.category == category).toList();

    if(currentSelected != SubCategory.all){
      productList = productList?.where((item) => item.subCategory == currentSelected).toList();
    }

    setState(() {
      items = productList ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = widget.title == "Clothes" ? clothesCategory : toysCategory;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor.fromHex("#5E7737"),
        title: Text(
          widget.title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: category
                    .map((value) =>
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSelected = value;
                            fetchProducts();
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: value == currentSelected
                                  ? HexColor.fromHex("#5E7737")
                                  : Colors.grey[400]),
                          width: 80,
                          height: 26,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(EnumToString.convertToString(value),
                                style: TextStyle(
                                    color: value == currentSelected
                                        ? Colors.white
                                        : Colors.black)),
                          ),
                        )))
                    .toList(),
              ),
              SizedBox(height: 20),
              items.isEmpty
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
              )
            ]),
          )),
    );
  }
}

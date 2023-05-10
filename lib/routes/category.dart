import 'package:flutter/material.dart';
import 'package:happy_second/utils/hexColor.dart';

class CategoryPage extends StatefulWidget {
  final String title;

  const CategoryPage({super.key, required this.title});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String currentSelected = "All";
  final toysCategory = ["All", "Plastic", "Plush", "Wooden"];
  final clothesCategory = ["All", "Women", "Men", "Children"];

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
        padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: category
                .map((value) => GestureDetector(
                    onTap: () {
                      setState(() {
                        currentSelected = value;
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
                        child: Text(value,
                            style: TextStyle(
                                color: value == currentSelected
                                    ? Colors.white
                                    : Colors.black)),
                      ),
                    )))
                .toList(),
          )
        ]),
      )),
    );
  }
}

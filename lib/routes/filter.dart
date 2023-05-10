import 'package:flutter/material.dart';

import '../utils/hexColor.dart';

class Filter extends StatefulWidget{
  const Filter({super.key});

  @override
  State<StatefulWidget> createState() => _FilterState();
}

class _FilterState extends State<Filter>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: HexColor.fromHex("#5E7737"), // change this color to whatever you want
        ),
        backgroundColor: Colors.white,
        title: Text("Filter",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: HexColor.fromHex("#5E7737"))),
        actions: [
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                iconSize: 30,
                icon: Icon(Icons.delete, color: HexColor.fromHex("#5E7737")),
                onPressed: () {
                  print("Delete all");
                },
              ))
        ],
      ),
    );
  }

}
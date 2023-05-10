import 'package:flutter/material.dart';
import 'package:happy_second/utils/hexColor.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              print("go to product details");
            },
            child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: Stack(
                  children: const [
                    Positioned(
                        child: Align(
                      alignment: Alignment.center,
                      child: Image(
                          height: 120,
                          width: 120,
                          image: AssetImage("lib/assets/shanyi.png")),
                    ))
                  ],
                ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
            child: Row(
              children: const [Text("Alter")],
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 20, 0),
            child: Row(
              children: const [
                Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "Demon Slayer - Agatsuma Zenitsu",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )
              ],
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "\$50",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                IconButton(
                    onPressed: () {
                      print("add to cart");
                    },
                    iconSize: 20,
                    icon: Icon(
                      Icons.shopping_cart,
                      color: HexColor.fromHex("#5E7737"),
                    ))
              ],
            )),
      ],
    );
  }
}

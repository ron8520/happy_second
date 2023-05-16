import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:happy_second/utils/hexColor.dart';

import '../../model/product.dart';

class ProductDetail extends StatelessWidget {
  Product product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Stack(
                  children: [
                    Center(
                        child: Image(
                            height: 360,
                            width: 360,
                            image: AssetImage(product.imageUrl!))),
                    // Replace with your image asset path
                    Positioned(
                      top: 16, // Adjust the positioning of the icon
                      left: 16, // Adjust the positioning of the icon
                      child: IconButton(
                        iconSize: 32,
                        color: HexColor.fromHex("#5E7737"),
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                )),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.black,
                        decoration: TextDecoration.none, // Remove underline
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                        decoration: TextDecoration.none, // Remove underline
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      product.brand,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[400],
                        decoration: TextDecoration.none, // Remove underline
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none, // Remove underline
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Text(
                      product.description,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[400],
                        decoration: TextDecoration.none, // Remove underline
                      ),
                    )),
                  ],
                ),
                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    // Handle checkout logic here
                    EasyLoading.showSuccess("Successfully add to cart");
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor.fromHex("#5E7737"),
                    fixedSize: const Size(400, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Change the value to adjust the radius
                    ),
                  ),
                  child: const Text('Add to Cart',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

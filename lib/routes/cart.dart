import 'package:flutter/material.dart';
import 'package:happy_second/utils/hexColor.dart';
import '../componets/dashLine.dart';
import 'checkout.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  List<CartItem> cartItems = [
    CartItem(name: 'Product A', price: 50.0),
    CartItem(name: 'Product B', price: 50.0),
    CartItem(name: 'Product C', price: 15.0),
    CartItem(name: 'Product D', price: 50.0),
  ];

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (CartItem item in cartItems) {
      totalPrice += item.price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: SizedBox(
                        height: 120,
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  print("go to product details");
                                },
                                child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey[300]),
                                    child: Stack(
                                      children: const [
                                        Positioned(
                                            child: Align(
                                          alignment: Alignment.center,
                                          child: Image(
                                              height: 100,
                                              width: 100,
                                              image: AssetImage(
                                                  "lib/assets/shanyi.png")),
                                        ))
                                      ],
                                    ))),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cartItem.name,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.close),
                                          onPressed: () {
                                            setState(() {
                                              cartItems.removeAt(index);
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          '\$${cartItem.price}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            //UI hack
            const Text(
                "---------------------------------------------------------"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${getTotalPrice().toStringAsFixed(2)} ',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const TextSpan(
                        text: 'AUD',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shipping:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '\$5.00 ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'AUD',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text(
                "---------------------------------------------------------"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Bag Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:'\$${(getTotalPrice() + 5).toStringAsFixed(2)} ',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const TextSpan(
                        text: 'AUD',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle checkout logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor.fromHex("#5E7737"),
                fixedSize: const Size(400, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Change the value to adjust the radius
                ),
              ),
              child: const Text('Checkout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 10),

          ],
        ));
  }
}

class CartItem {
  String name;
  double price;

  CartItem({required this.name, required this.price});
}

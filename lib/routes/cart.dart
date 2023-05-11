import 'package:flutter/material.dart';
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return ListTile(
                      leading: Image(image: AssetImage("lib/assets/shanyi.png")),
                      title: Text(cartItem.name,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      subtitle: Text('\$${cartItem.price}',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                cartItems.removeAt(index);
                              });
                            },
                          ),
                        ]
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${getTotalPrice().toStringAsFixed(2)} AUD',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$5.00 AUD',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.black,
              thickness: 1,
              indent: 10,
              endIndent: 10,
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bag Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${(getTotalPrice() + 5).toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle checkout logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(94, 119, 55,1),
                onPrimary: Colors.white, // text color
                minimumSize: Size(200, 50),
              ),
            ),
          ],
        ));
  }
}

class CartItem {
  String name;
  double price;

  CartItem({required this.name, required this.price});
}

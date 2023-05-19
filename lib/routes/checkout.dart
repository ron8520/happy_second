import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../componets/checkout/paymentCardList.dart';
import '../componets/checkout/paymentSuccess.dart';
import '../states/app.dart';
import '../utils/hexColor.dart';
import 'myorder.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String personName = 'John Doe';
  String address = '123 Main St, City, Postal Code';
  String phoneNumber = '123-456-7890';

  void editAddress() async {
    final updatedAddress = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String newPersonName = personName;
        String newAddress = address;
        String newPhoneNumber = phoneNumber;

        return AlertDialog(
          title: const Text('Edit Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newPersonName = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Person Name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newAddress = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newPhoneNumber = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(94, 119, 55, 1)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  personName = newPersonName;
                  address = newAddress;
                  phoneNumber = newPhoneNumber;
                });
                Navigator.of(context).pop(newAddress);
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(94, 119, 55, 1)),
            ),
          ],
        );
      },
    );

    if (updatedAddress != null) {
      print('Updated address: $updatedAddress');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: HexColor.fromHex("#5E7737"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Delivery Address',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            personName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              onPressed: editAddress,
                              icon: const Icon(Icons.edit))
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          address,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          phoneNumber,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )),
            const Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'Payment Details',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            HorizontalSwipeCard(),
            const SizedBox(height: 16.0),
            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal:',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '\$20.0 ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'AUD',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
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
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '\$5.00 ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'AUD',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
                "-----------------------------------------------------------"),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Delivery Date:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text('May 15, 2023',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Price: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '\$170.00 ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      TextSpan(
                        text: 'AUD',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                // Handle checkout logic here
                final app = Provider.of<AppModel>(context, listen: false);
                await app.checkout(context).then(
                    (value) => Navigator.pushNamed(context, '/paymentSuccess'));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor.fromHex("#5E7737"),
                fixedSize: const Size(400, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Change the value to adjust the radius
                ),
              ),
              child: const Text('Pay Now',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

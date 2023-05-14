import 'package:flutter/material.dart';

import '../../utils/hexColor.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 100.0,
              color: Colors.green,
            ),
            const SizedBox(height: 20.0),
            const Text(
              "Payment Successful",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Thank you for your purchase!",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                // Handle checkout logic here
                Navigator.of(context).pushReplacementNamed('/');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor.fromHex("#5E7737"),
                fixedSize: const Size(240, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Change the value to adjust the radius
                ),
              ),
              child: const Text("Back to Home",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
    );
  }
}
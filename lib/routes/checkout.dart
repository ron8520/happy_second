import 'package:flutter/material.dart';
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
          title: Text('Edit Address'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newPersonName = value;
                },
                decoration: InputDecoration(
                  labelText: 'Person Name',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newAddress = value;
                },
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
              TextField(
                onChanged: (value) {
                  newPhoneNumber = value;
                },
                decoration: InputDecoration(
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
                primary: Color.fromRGBO(94, 119, 55, 1)
              ),
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
                primary: Color.fromRGBO(94, 119, 55, 1)
              ),
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
        title: Text('Checkout'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(94, 119, 55, 1),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        Row(
        children: [
        Expanded(
        child: GestureDetector(
          onTap: editAddress,
          child: Row(
            children: [
              Text(
                'Delivery Address',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                Icons.edit,
                size: 16.0,
              ),
            ],
          ),
        ),
      ),
      ],
    ),
    SizedBox(height: 8.0),
    Text(
        personName,
        style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
    Text(
        address,
        style: TextStyle(fontSize: 16),
        ),
    Text(
        phoneNumber,
        style: TextStyle(fontSize: 16),
        ),
    SizedBox(height: 16.0),
    Text(
        'Payment Details',
        style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        ),
    ),
    SizedBox(height: 8.0),
    DropdownButtonFormField<String>(
        decoration: InputDecoration(
        labelText: 'Select Card',
        ),
              items: <String>['Card 1', 'Card 2', 'Card 3', 'Card 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle card selection
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Total Price: \$100'),
            SizedBox(height: 8.0),
            Text('Delivery Date: May 15, 2023'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle checkout logic here
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrderHistoryPage()),
                );
              },
              child: Text('Pay Now'),
              style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(94, 119, 55, 1),
              onPrimary: Colors.white,
              minimumSize: Size(200, 50),
            ),
            )],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CheckoutPage(),
  ));
}
import 'package:flutter/material.dart';

class SubscribePage extends StatefulWidget {
  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  String selectedPlan = '';

  List<String> plans = ['Basic', 'Standard', 'Premium'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose a subscription plan:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: plans.length,
              itemBuilder: (context, index) {
                String plan = plans[index];
                return ListTile(
                  title: Text(plan),
                  leading: Radio(
                    value: plan,
                    groupValue: selectedPlan,
                    onChanged: (value) {
                      setState(() {
                        selectedPlan = value.toString();
                      });
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (selectedPlan.isNotEmpty) {
                  // Perform subscription logic here
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Subscription Successful'),
                        content: Text('You have subscribed to the $selectedPlan plan.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please select a subscription plan.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Subscribe'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SubscribePage(),
  ));
}
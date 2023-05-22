import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../states/app.dart';
import '../utils/hexColor.dart';

class SubscribePage extends StatefulWidget {
  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  List<String> plans = ['One Month', 'Three Months', 'Six Months'];
  List<String> details = [
    'Enjoy the full 30 days of subscription for full length. At no additional cost.',
    'Enjoy the full 90 days of subscription for full length. At no additional cost.',
    'Enjoy the full 180 days of subscription for full length. At no additional cost.'
  ];
  List<String> currentPrices = ["19.99", "59.99", "108.99"];
  List<String> originalPrice = ["21.99", "62.99", "129.99"];

  bool _isChecked = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final app = Provider.of<AppModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscribe',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        backgroundColor: HexColor.fromHex("#5E7737"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get ',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: HexColor.fromHex("#5E7737")),
            ),
            Text(
              'Premium ! ! !',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: HexColor.fromHex("#5E7737")),
            ),
            const Text(
              'One more step to join our amazing community and unlock incredible feature',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20.0),
            Expanded(
                child: SizedBox(
              height: 400,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: plans.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Container(
                            height: 120,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? HexColor.fromHex("#5E7737")
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      plans[index],
                                      style: TextStyle(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      details[index],
                                      style: TextStyle(
                                        color: selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                )),
                                Padding(
                                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '\$${currentPrices[index]}',
                                          style: TextStyle(
                                            color: selectedIndex == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          '\$${originalPrice[index]}',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ))
                              ],
                            )),
                      ));
                },
              ),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  shape: const CircleBorder(),
                  activeColor: HexColor.fromHex("#5E7737"),
                  value: _isChecked,
                  onChanged: (bool? value) => {
                    setState(() {
                      _isChecked = value!;
                    })
                  },
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'I Accept the ',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Terms of service',
                        style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            color: HexColor.fromHex("#5E7737")),
                      ),
                      const TextSpan(
                        text: ' and ',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                      TextSpan(
                        text: 'Privacy policy',
                        style: TextStyle(
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            color: HexColor.fromHex("#5E7737")),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                // Handle checkout logic here
                if (_isChecked) {
                  await app.updateUserType(context).then((value) =>
                      Navigator.pushNamed(context, '/paymentSuccess'));
                } else {
                  EasyLoading.showInfo("You have to view our policy first");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor.fromHex("#5E7737"),
                fixedSize: const Size(400, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      20), // Change the value to adjust the radius
                ),
              ),
              child: const Text('Subscribe Now',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}

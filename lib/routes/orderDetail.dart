import 'package:flutter/material.dart';
import 'package:happy_second/utils/hexColor.dart';
import 'package:intl/intl.dart';
import '../componets/product/product_card.dart';
import '../componets/product/product_detail.dart';
import '../model/order.dart';

class OrderDetailPage extends StatelessWidget {
  final Order order;
  final int index;

  OrderDetailPage({required this.order, required this.index});

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat('yyyy MMM dd HH:mm');

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tracking Order",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: HexColor.fromHex("#5E7737"),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("Order Id: ${order.uuid}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: order.items.length,
                        itemBuilder: (context, index) {
                          final cartItem = order.items[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: SizedBox(
                              height: 120,
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.grey[300]),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                  child: Align(
                                                alignment: Alignment.center,
                                                child: Image(
                                                    height: 100,
                                                    width: 100,
                                                    image: AssetImage(
                                                        cartItem.imageUrl!)),
                                              ))
                                            ],
                                          ))),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  cartItem.name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                ),
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
                                                    fontWeight:
                                                        FontWeight.bold),
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
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text("History",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                          ],
                        )),
                    index == 2
                        ? Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: HexColor.fromHex("#5E7737"),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: HexColor.fromHex("#F38127"),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Arrived",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        dateFormat.format(DateTime.now()),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        "Received and signed by Wang Zai",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ))
                        : const SizedBox.shrink(),
                    const SizedBox(height: 10),
                    index != 0
                        ? Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: HexColor.fromHex("#5E7737"),
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: HexColor.fromHex("#F38127"),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Newton",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        dateFormat.format(DateTime.now()
                                            .subtract(const Duration(days: 3))),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        "Your order has arrived at Newton",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      const Text(
                                        "Please wait for the next info.",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ))
                        : const SizedBox.shrink(),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: HexColor.fromHex("#5E7737"),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          height: 14,
                                          width: 14,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  HexColor.fromHex("#9BBBFF")),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 0, 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Order Created",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              dateFormat.format(DateTime.now()),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14)),
                                          const SizedBox(height: 20),
                                          const Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Text(
                                                "Payment paid by credit card",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(height: 10),
                          ],
                        )),
                  ],
                ))));
  }
}

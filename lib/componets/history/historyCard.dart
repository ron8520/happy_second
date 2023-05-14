import 'package:flutter/material.dart';

import '../../utils/hexColor.dart';

class HistoryCard extends StatefulWidget {
  final order;

  HistoryCard({required this.order});

  @override
  State<StatefulWidget> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  Color statusColor = HexColor.fromHex("#779FFE");

  @override
  void initState() {
    if (widget.order.status == "Processing") {
      statusColor = HexColor.fromHex("#5E7737");
    } else if (widget.order.status == "Delivered") {
      statusColor = HexColor.fromHex("#F38127");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Container(
          padding: EdgeInsets.all(10),
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.grey[400]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Id: ${widget.order.id}",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Items 4"),
                ],
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: statusColor),
                width: 100,
                height: 30,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('${widget.order.status}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${widget.order.date}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        '\$${widget.order.total}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ],
          ),
        ));
  }
}

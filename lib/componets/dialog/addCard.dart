import 'package:flutter/material.dart';
import 'package:happy_second/model/user.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../states/app.dart';
import '../../utils/hexColor.dart';

class AddCardDialog extends StatefulWidget {
  @override
  _AddCardDialogState createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<AddCardDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();

  late DateTime _expirationDate;
  final TextEditingController _cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _expirationDate = DateTime.now();
  }



  Future<void> _selectExpirationDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now()
          .add(Duration(days: 365 * 10)), // 10 years in the future
    );
    if (picked != null && picked != _expirationDate) {
      setState(() {
        _expirationDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        contentPadding: const EdgeInsets.all(20),
        title: const Text("Add New Card"),
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: HexColor.fromHex("#5E7737"),
                    controller: _cardNumberController,
                    decoration: InputDecoration(
                        labelText: 'Card Number',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: HexColor.fromHex("#5E7737")),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a card number';
                      }
                      final number = int.tryParse(value);
                      if (number == null) {
                        return 'Invalid number';
                      }
                      if(value.length != 16){
                        return 'Card number must 16 digit number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    cursorColor: HexColor.fromHex("#5E7737"),
                    controller: _cardHolderController,
                    decoration: InputDecoration(
                        labelText: 'Card Holder',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: HexColor.fromHex("#5E7737")),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a card holder';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      _selectExpirationDate(context);
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: TextEditingController(
                            text:
                            DateFormat('MM/yyyy').format(_expirationDate)),
                        decoration: InputDecoration(
                            labelText: 'Expiration Date',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: HexColor.fromHex("#5E7737")),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select an expiration date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _cvvController,
                    cursorColor: HexColor.fromHex("#5E7737"),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        helperStyle: TextStyle(fontWeight: FontWeight.bold),
                        labelText: 'CVV',
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                          BorderSide(color: HexColor.fromHex("#5E7737")),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a CVV';
                      }
                      final number = int.tryParse(value);
                      if (number == null) {
                        return 'Invalid CVV';
                      }
                      if(value.length != 3){
                        return 'Card number must 3 digit number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Save the credit card details
                        String cardNumber = _cardNumberController.text;
                        DateTime expirationDate = _expirationDate;
                        String cvv = _cvvController.text;
                        String cardHolder = _cardHolderController.text;
                        final app = Provider.of<AppModel>(
                            context, listen: false);
                        PaymentCard newCard = PaymentCard(
                            uuid: const Uuid().v4(),
                            number: cardNumber,
                            cardHolder: cardHolder,
                            cvv: cvv,
                            expiryDate: expirationDate);

                        await app.addNewCard(context, newCard).then((value) =>
                            Navigator.of(context).pop()  // Close the dialog
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 40),
                        backgroundColor: HexColor.fromHex("#5E7737"),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddCardDialog extends StatefulWidget {
  @override
  _AddCardDialogState createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<AddCardDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _cardNumberController = TextEditingController();
  late DateTime _expirationDate;
  final TextEditingController _cvvController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _expirationDate = DateTime.now();
  }


  Future<void> _selectExpirationDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365 * 10)), // 10 years in the future
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
        title: const Text("Add new Card"),
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _cardNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Card Number',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a card number';
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
                          text:  DateFormat('MM/yyyy').format(_expirationDate)
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Expiration Date',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please select an expiration date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _cvvController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a CVV';
                      }
                      return null;
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate()) {
                        // Save the credit card details
                        String cardNumber = _cardNumberController.text;
                        String expirationDate = _expirationDate.toString();
                        String cvv = _cvvController.text;

                        // Perform further actions with the data (e.g., save to database)
                        // ...

                        Navigator.of(context).pop(); // Close the dialog
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ]);
  }

}
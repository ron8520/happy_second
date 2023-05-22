import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:happy_second/model/product.dart';
import 'package:happy_second/utils/hexColor.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../states/app.dart';
import '../states/search.dart';

class UploadProductPage extends StatefulWidget {
  @override
  _UploadProductPageState createState() => _UploadProductPageState();
}

class _UploadProductPageState extends State<UploadProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();

  String dropdownValue =
      Category.clothes.toString().replaceAll('Category.', '');
  String subCategoryValue =
      SubCategory.plastic.toString().replaceAll('SubCategory.', '');

  Future<void> _uploadNewItem() async {
    final app = Provider.of<AppModel>(context, listen: false);
    final search = Provider.of<SearchModel>(context, listen: false);

    final form = _formKey.currentState;
    if (form!.validate()) {
      final newProduct = Product(
          uuid: const Uuid().v4(),
          name: _nameController.text,
          price: int.parse(_priceController.text),
          category: EnumToString.fromString(Category.values, dropdownValue)!,
          subCategory:
              EnumToString.fromString(SubCategory.values, subCategoryValue)!,
          imageUrl: "lib/assets/product/shanyi.png",
          brand: _brandController.text,
          description: _descriptionController.text,
          createdAt: DateTime.now()
      );
      await app.uploadNewItem(context, newProduct).then((value) => {
            search.fetchAllProducts(context),
            app.fetchProducts(context),
            Navigator.pop(context),
            EasyLoading.showSuccess("Upload product Successfully")
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Upload Product",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: HexColor.fromHex("#5E7737"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Item Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: 'Product Name',
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(94, 119, 55, 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(94, 119, 55, 1)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter item name';
                  }
                  if (value.length > 30) {
                    return 'Name too long';
                  }
                  return null;
                },
              ),
              // Price
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(
                    labelText: 'Price',
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(94, 119, 55, 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(94, 119, 55, 1)))),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the price';
                  }
                  final price = double.tryParse(value);
                  if (price == null) {
                    return 'Invalid price';
                  }
                  if (price < 0) {
                    return 'Price cannot be negative';
                  }
                  if (!value.contains(RegExp(r'^\d+(\.\d{1,2})?$'))) {
                    return 'Invalid price format';
                  }
                  return null;
                },
              ),
              // Type
              DropdownButtonFormField<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                decoration: const InputDecoration(
                    labelText: 'Category',
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(94, 119, 55, 1)),
                    focusColor: Color.fromRGBO(94, 119, 55, 1),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(94, 119, 55, 1)))),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>[
                  Category.clothes.toString().replaceAll('Category.', ''),
                  Category.toys.toString().replaceAll('Category.', ''),
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              // Brand
              TextFormField(
                controller: _brandController,
                decoration: const InputDecoration(
                    labelText: 'Brand',
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(94, 119, 55, 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(94, 119, 55, 1)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the brand';
                  }
                  if (value.length > 20) {
                    return 'Brand too long';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                value: subCategoryValue,
                icon: const Icon(Icons.arrow_downward),
                decoration: const InputDecoration(
                    labelText: 'SubCategory',
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(94, 119, 55, 1)),
                    focusColor: Color.fromRGBO(94, 119, 55, 1),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(94, 119, 55, 1)))),
                onChanged: (String? newValue) {
                  setState(() {
                    subCategoryValue = newValue!;
                  });
                },
                items: <String>[
                  SubCategory.plastic.toString().replaceAll('SubCategory.', ''),
                  SubCategory.wooden.toString().replaceAll('SubCategory.', ''),
                  SubCategory.women.toString().replaceAll('SubCategory.', ''),
                  SubCategory.men.toString().replaceAll('SubCategory.', ''),
                  SubCategory.children
                      .toString()
                      .replaceAll('SubCategory.', ''),
                  SubCategory.plush.toString().replaceAll('SubCategory.', ''),
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(94, 119, 55, 1)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(94, 119, 55, 1)))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  if (value.length > 250) {
                    return 'description too long';
                  }
                  return null;
                },
              ),
              // Submit Button
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: _uploadNewItem,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: HexColor.fromHex("#5E7737"),
                    fixedSize: const Size(400, 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20), // Change the value to adjust the radius
                    ),
                  ),
                  child: const Text('Upload',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:happy_second/componets/product/product_detail.dart';
import 'package:happy_second/utils/hexColor.dart';
import 'package:provider/provider.dart';

import '../../model/product.dart';
import '../../routes/login.dart';
import '../../states/app.dart';
import '../../utils/storage/sharedPreferences_util.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  void _handleAddToCart(BuildContext context) {
    if (SharedPreferencesUtil.preferences.getString("userId") == null) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ));
    }else{
      EasyLoading.showSuccess("Add to Cart Successfully!");
      final app = Provider.of<AppModel>(context, listen: false);
      app.addToCart(context, product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetail(product: product)),
              );
            },
            child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[300]),
                child: Stack(
                  children: [
                    Positioned(
                        child: Align(
                      alignment: Alignment.center,
                      child: Image(
                          height: 120,
                          width: 120,
                          image: AssetImage(product.imageUrl!)),
                    ))
                  ],
                ))),
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 20, 0),
            child: Row(
              children: [Text("${product.brand}")],
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 5, 20, 0),
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "${product.name}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                )
              ],
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${product.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                IconButton(
                    onPressed: () => _handleAddToCart(context),
                    iconSize: 20,
                    icon: Icon(
                      Icons.shopping_cart,
                      color: HexColor.fromHex("#5E7737"),
                    ))
              ],
            )),
      ],
    );
  }
}


import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:happy_second/database/db.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../model/product.dart';
import '../model/user.dart';

class AppModel extends ChangeNotifier {
  User? currentUser;
  String? userId;

  AppModel({this.userId});

  Future<void> addToCart(BuildContext context, Product product) async {
    if (currentUser == null) {
      return;
    }
    final db = Provider.of<AppDatabase>(context, listen: false);
    currentUser!.cart?.add(product);

    await db.createCartItem(CartsCompanion(
        uuid: Value(const Uuid().v4()),
        userId: Value(currentUser!.uuid),
        productId: Value(product.uuid)));


    notifyListeners();
  }

  Future<void> removeFromCart(BuildContext context, int index) async {
    if (currentUser == null) {
      return;
    }
    EasyLoading.showSuccess("Remove item from the cart successfully!");
    final db = Provider.of<AppDatabase>(context, listen: false);
    await db.deleteCartItem(currentUser!.uuid, currentUser!.cart![index].uuid);
    currentUser!.cart?.removeAt(index);

    notifyListeners();
  }

  Future<void> fetchUserDetails(BuildContext context) async {
    if(userId == null){
      return;
    }
    final db = Provider.of<AppDatabase>(context, listen: false);
    currentUser = await db.findUserById(userId!);
    notifyListeners();
  }

  Future<void> removeAllCartItems(BuildContext context) async {
    if (currentUser == null) {
      return;
    }
    final db = Provider.of<AppDatabase>(context, listen: false);
    await db.deleteAllCartItems(currentUser!.uuid);
    currentUser!.cart = [];
    notifyListeners();
  }
}

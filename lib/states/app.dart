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
    if (userId == null) {
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

  Future<void> addNewCard(BuildContext context, PaymentCard newCard) async {
    final db = Provider.of<AppDatabase>(context, listen: false);
    currentUser!.cards!.add(newCard);

    await db.createNewCard(PaymentCardsCompanion(
        uuid: Value(const Uuid().v4()),
        userId: Value(currentUser!.uuid),
        expiryDate: Value(newCard.expiryDate),
        cvv: Value(newCard.cvv),
        cardNumber: Value(newCard.number),
        cardHolder: Value(newCard.cardHolder)));
    EasyLoading.showSuccess("Add new Card Successfully!");
    notifyListeners();
  }

  Future<void> removeCard(BuildContext context) async {
    if (currentUser != null) {
      final db = Provider.of<AppDatabase>(context, listen: false);
      for (PaymentCard card in currentUser!.cards!) {
        if (card.selected) {
          await db.deletePaymentCard(currentUser!.uuid, card.uuid);
        }
      }
      currentUser!.cards!.removeWhere((card) => card.selected);
      EasyLoading.showSuccess("Remove card Successfully!");
    }
  }

  Future<void> checkout(BuildContext context) async {
    if (currentUser != null) {
      await removeAllCartItems(context);
    }
  }

  Future<void> updateUserDetails(BuildContext context, String updateName,
      String updatedNumber, String updatePassword) async {
    if (currentUser == null) {
      return;
    }
    final db = Provider.of<AppDatabase>(context, listen: false);
    currentUser = await db.updateUserDetails(currentUser!.uuid, UsersCompanion(
      uuid: Value(currentUser!.uuid),
      emailAddress: Value(currentUser!.emailAddress),
      number: Value(updatedNumber),
      username: Value(updateName),
      password: Value(updatePassword),
      userType: Value(currentUser!.usertype)
    ));
    notifyListeners();
  }

  Future<void> updateUserType(BuildContext context) async {
    if(currentUser == null){
      return;
    }
    final db = Provider.of<AppDatabase>(context, listen: false);
    currentUser = await db.updateUserDetails(currentUser!.uuid, UsersCompanion(
        uuid: Value(currentUser!.uuid),
        emailAddress: Value(currentUser!.emailAddress),
        number: Value(currentUser!.number),
        username: Value(currentUser!.username),
        password: Value(currentUser!.password),
        userType: const Value(UserType.seller)
    ));
    notifyListeners();
  }
}

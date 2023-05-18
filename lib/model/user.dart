import 'package:drift/drift.dart';
import 'package:happy_second/model/product.dart';
import 'package:json_annotation/json_annotation.dart';
import '../database/db.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uuid;
  final String username;
  final String emailAddress;
  final String password;
  UserType usertype;
  List<PaymentCard>? cards;
  List<Product>? cart;

  User({required this.uuid,
    required this.username,
    required this.emailAddress,
    required this.password,
    required this.usertype,
    this.cart,
    this.cards});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  UsersCompanion toUsersCompanion() =>
      UsersCompanion(
        uuid: Value(uuid),
        username: Value(username),
        emailAddress: Value(emailAddress),
        password: Value(password),
        userType: Value(usertype),
      );

  factory User.fromDB(UsersDB user,
      {List<ProductDB>? carts, List<CardDB>? cards}) =>
      User(
          uuid: user.uuid,
          username: user.username,
          emailAddress: user.emailAddress,
          password: user.password,
          usertype: user.userType,
          cart: carts != null ? carts.map((i) => Product.fromDB(i)).toList()
              : [],
          cards: cards != null ? cards.map((i) => PaymentCard.fromDB(i))
              .toList() : []
      );
}

@JsonSerializable()
class PaymentCard {
  final String uuid;
  final String number;
  final String cardHolder;
  final String cvv;
  final DateTime expiryDate;
  bool selected;

  PaymentCard({
    required this.uuid,
    required this.number,
    required this.cardHolder,
    required this.cvv,
    required this.expiryDate,
    this.selected = false,
  });

  factory PaymentCard.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCardToJson(this);

  factory PaymentCard.fromDB(CardDB card) =>
      PaymentCard(
          uuid: card.uuid,
          number: card.cardNumber,
          cardHolder: card.cardHolder,
          cvv: card.cvv,
          expiryDate: card.expiryDate);
}

enum UserType { normal, seller }

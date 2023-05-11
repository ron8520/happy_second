import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import '../database/db.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uuid;
  final String username;
  final String emailAddress;
  final String password;
  UserType? usertype;
  List<PaymentCard>? cards;

  User(
      {
      required this.uuid,
      required this.username,
      required this.emailAddress,
      required this.password,
      this.usertype,
      this.cards});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  UsersCompanion toUsersCompanion() => UsersCompanion(
    uuid: Value(uuid),
    username: Value(username),
    emailAddress: Value(emailAddress),
    password: Value(password)
  );

  factory User.fromDB(UsersDB user) => User(
    uuid: user.uuid,
    username: user.username,
    emailAddress: user.emailAddress,
    password: user.password
  );
}

@JsonSerializable()
class PaymentCard {
  final String number;
  final String cardHolder;

  PaymentCard({required this.number, required this.cardHolder});

  factory PaymentCard.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentCardToJson(this);
}

enum UserType { normal, seller }

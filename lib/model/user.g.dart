// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uuid: json['uuid'] as String,
      username: json['username'] as String,
      emailAddress: json['emailAddress'] as String,
      password: json['password'] as String,
      usertype: $enumDecodeNullable(_$UserTypeEnumMap, json['usertype']),
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => PaymentCard.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'username': instance.username,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'usertype': _$UserTypeEnumMap[instance.usertype],
      'cards': instance.cards,
    };

const _$UserTypeEnumMap = {
  UserType.normal: 'normal',
  UserType.seller: 'seller',
};

PaymentCard _$PaymentCardFromJson(Map<String, dynamic> json) => PaymentCard(
      number: json['number'] as String,
      cardHolder: json['cardHolder'] as String,
    );

Map<String, dynamic> _$PaymentCardToJson(PaymentCard instance) =>
    <String, dynamic>{
      'number': instance.number,
      'cardHolder': instance.cardHolder,
    };

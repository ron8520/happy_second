import 'dart:io';
import 'dart:convert';
import "package:collection/collection.dart";
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:flutter/material.dart' hide Table, Column;
import 'package:happy_second/model/product.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../model/user.dart';

part 'db.g.dart';

@DataClassName('UsersDB')
class Users extends Table {
  TextColumn get uuid => text().withLength(min: 36, max: 36)();

  TextColumn get username => text().withLength(min: 0, max: 36)();

  TextColumn get emailAddress => text().withLength(min: 0, max: 36)();

  TextColumn get password => text()();

  IntColumn get userType => intEnum<UserType>()();

  @override
  Set<Column> get primaryKey => {uuid};
}

@DataClassName('ProductDB')
class Products extends Table {
  TextColumn get uuid => text().withLength(min: 36, max: 36)();

  TextColumn get name => text()();

  TextColumn get brand => text().withLength(min: 0, max: 36)();

  TextColumn get description => text()();

  IntColumn get price => integer()();

  IntColumn get subCategory => intEnum<SubCategory>()();

  IntColumn get category => intEnum<Category>()();

  TextColumn get image => text().nullable()();

  @override
  Set<Column> get primaryKey => {uuid};
}

@DataClassName('CartDB')
class Carts extends Table {
  TextColumn get uuid => text().withLength(min: 36, max: 36)();

  TextColumn get userId => text().withLength(min: 36, max: 36)();

  TextColumn get productId => text().withLength(min: 36, max: 36)();

  @override
  Set<Column> get primaryKey => {uuid};
}

@DataClassName('CardDB')
class PaymentCards extends Table {
  TextColumn get uuid => text().withLength(min: 36, max: 36)();

  TextColumn get userId => text().withLength(min: 36, max: 36)();

  DateTimeColumn get expiryDate => dateTime()();

  TextColumn get cardHolder => text()();

  TextColumn get cardNumber => text()();

  TextColumn get cvv => text()();


  @override
  Set<Column> get primaryKey => {uuid};
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

// this annotation tells moor to prepare a database class that uses both of the
// tables we just defined. We'll see how to use that database class in a moment.
@DriftDatabase(tables: [Users, Products, Carts, PaymentCards])
class AppDatabase extends _$AppDatabase {
  String? dbPath;

  // we tell the database where to store the data with this constructor
  AppDatabase({Key? key, this.dbPath}) : super(_openConnection());

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await batch((b) {
          b.insertAll(products, [
            ProductsCompanion.insert(
                uuid: const Uuid().v4(),
                name: "Demon Slayer - Agatsuma Zenitsu",
                brand: "Alter",
                description:
                    "Zenitsu Agatsuma is one of the main characters of Demon Slayer: Kimetsu no Yaiba and along with Inosuke Hashibira, a travelling companion of Tanjiro Kamado and Nezuko Kamado. He is also a Demon Slayer in the Demon Slayer Corps.",
                price: 50,
                subCategory: SubCategory.plastic,
                category: Category.toys,
                image: const Value("lib/assets/product/shanyi.png")),
            ProductsCompanion.insert(
                uuid: const Uuid().v4(),
                name: "Demon Slayer - Kamado Tanjirou",
                brand: "Alter",
                description:
                    "Tanjiro Kamado is a fictional character and the main protagonist of Koyoharu Gotouge's manga Demon Slayer: Kimetsu no Yaiba. Tanjiro goes on a quest to restore the humanity of his sister, Nezuko, who was turned into a demon after his family was killed by Muzan Kibutsuji following an attack that resulted in the death of his other relatives..",
                price: 70,
                subCategory: SubCategory.wooden,
                category: Category.toys,
                image: const Value("lib/assets/product/tanzhilang.png")),
            ProductsCompanion.insert(
                uuid: const Uuid().v4(),
                name: "Demon Slayer - Hashibira Inosuke",
                brand: "Alter",
                description:
                    "Inosuke Hashibira is one of the main characters of Demon Slayer: Kimetsu no Yaiba and along with Zenitsu Agatsuma, a traveling companion of Tanjiro Kamado and Nezuko Kamado. He is also a Demon Slayer in the Demon Slayer Corps",
                price: 60,
                subCategory: SubCategory.plush,
                category: Category.toys,
                image: const Value("lib/assets/product/yizhizhu.png")),
            ProductsCompanion.insert(
                uuid: const Uuid().v4(),
                name: "Solid Button Front Dress",
                brand: "SHEIN",
                description:
                    "Sing long her way size. Waited end mutual missed myself the little sister one. So in pointed or chicken cheered neither spirits invited. Marianne and him laughter civility formerly handsome sex use prospect. Hence we doors is given rapid scale above am. Difficult ye mr delivered behaviour by an. If their woman could do wound on. You folly taste hoped their above are and but.",
                price: 200,
                subCategory: SubCategory.women,
                category: Category.clothes,
                image: const Value("lib/assets/product/dress.png")),
            ProductsCompanion.insert(
                uuid: const Uuid().v4(),
                name: "Brown Cotton Jumper",
                brand: "SHEIN",
                description:
                    "Included is our Relaxed cotton sweater. Made from 100% cotton yarn, in a relaxed silhouette and featuring a ribbed high neckline. This sweater is the perfect piece to keep your little one rugged up through cold days and nights. Mix and match with other pieces from our collection.Each piece has been designed to work together harmoniously so that any combination goes.",
                price: 80,
                subCategory: SubCategory.men,
                category: Category.clothes,
                image: const Value("lib/assets/product/jacket.png")),
            ProductsCompanion.insert(
                uuid: const Uuid().v4(),
                name: "Sky Blue Blazer",
                brand: "SHEIN",
                description:
                    "Sing long her way size. Waited end mutual missed myself the little sister one. So in pointed or chicken cheered neither spirits invited. Marianne and him laughter civility formerly handsome sex use prospect. Hence we doors is given rapid scale above am. Difficult ye mr delivered behaviour by an. If their woman could do wound on. You folly taste hoped their above are and but.",
                price: 30,
                subCategory: SubCategory.children,
                category: Category.clothes,
                image: const Value("lib/assets/product/baby.png"))
          ]);
        });
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {},
    );
  }

  Future<void> createUser(UsersCompanion user) async {
    return transaction(() async {
      await into(users).insert(user);
    });
  }

  Future<void> createCartItem(CartsCompanion cart) async {
    return transaction(() async {
      await into(carts).insert(cart);
    });
  }

  Future<void> createNewCard(PaymentCardsCompanion card) async {
    return transaction(() async {
      await into(paymentCards).insert(card);
    });
  }

  Future<void> deletePaymentCard(String userId, String cardId) async {
    return transaction(() async {
      await (delete(paymentCards)
        ..where(
                (t) => t.userId.equals(userId) & t.uuid.equals(cardId)))
          .go();
    });
  }

  Future<void> deleteCartItem(String userId, String productId) async {
    return transaction(() async {
      await (delete(carts)
            ..where(
                (t) => t.userId.equals(userId) & t.productId.equals(productId)))
          .go();
    });
  }

  Future<void> deleteAllCartItems(String userId) async {
    return transaction(() async {
      await (delete(carts)
          ..where(
              (t) => t.userId.equals(userId)
          )
      ).go();
    });
  }


  Future<User?> findUser(String username) async {
    try {
      final user = await (select(users)
            ..where((item) => item.username.equals(username)))
          .getSingle();

      return User.fromDB(user);
    } catch (e) {
      return null;
    }
  }

  Future<User?> findUserByEmail(String email) async {
    try {
      final user = await (select(users)
            ..where((item) => item.emailAddress.equals(email)))
          .getSingle();

      final cartItems = await (select(carts)
        ..where((item) => item.userId.equals(user.uuid)))
          .get();

      final productIds = cartItems.map((cartItem) => cartItem.productId).toList();

      final product = await (select(products)
        ..where((item) => item.uuid.isIn(productIds))).get();

      final cards = await (select(paymentCards)
          ..where((item) => item.userId.equals(user.uuid))
      ).get();

      return User.fromDB(user, carts: product, cards: cards);
    } catch (e) {
      return null;
    }
  }

  Future<List<Product>?> findProducts() async {
    try {
      final allProduct = await select(products).get();
      return allProduct.map((product) => Product.fromDB(product)).toList();
    } catch (e) {
      return null;
    }
  }

  Future<User?> findUserById(String id) async {
    try {
      final user = await (select(users)
        ..where((item) => item.uuid.equals(id)))
          .getSingle();

      final cartItems = await (select(carts)
          ..where((item) => item.userId.equals(id)))
          .get();

      final productIds = cartItems.map((cartItem) => cartItem.productId).toList();

      final product = await (select(products)
          ..where((item) => item.uuid.isIn(productIds))).get();

      final cards = await (select(paymentCards)
        ..where((item) => item.userId.equals(user.uuid))
      ).get();

      return User.fromDB(user, carts: product, cards: cards);

    } catch (e) {
      return null;
    }
  }

}

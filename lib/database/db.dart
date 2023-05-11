
import 'dart:io';
import 'dart:convert';
import "package:collection/collection.dart";
import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'package:flutter/material.dart' hide Table;
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'db.g.dart';


@DataClassName('User')
class Users extends Table {
  TextColumn get uuid => text().withLength(min: 36, max: 36)();

  TextColumn get username => text().withLength(min: 36, max: 36)();

  TextColumn get emailAddress => text().withLength(min: 36, max: 36)();

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
@DriftDatabase(tables: [
  Users,
])
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
      onCreate: (Migrator m) {
        return m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
      beforeOpen: (details) async {},
    );
  }
}
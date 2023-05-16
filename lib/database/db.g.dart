// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UsersDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailAddressMeta =
      const VerificationMeta('emailAddress');
  @override
  late final GeneratedColumn<String> emailAddress = GeneratedColumn<String>(
      'email_address', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, username, emailAddress, password];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UsersDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('email_address')) {
      context.handle(
          _emailAddressMeta,
          emailAddress.isAcceptableOrUnknown(
              data['email_address']!, _emailAddressMeta));
    } else if (isInserting) {
      context.missing(_emailAddressMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  UsersDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersDB(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      emailAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email_address'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UsersDB extends DataClass implements Insertable<UsersDB> {
  final String uuid;
  final String username;
  final String emailAddress;
  final String password;
  const UsersDB(
      {required this.uuid,
      required this.username,
      required this.emailAddress,
      required this.password});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['username'] = Variable<String>(username);
    map['email_address'] = Variable<String>(emailAddress);
    map['password'] = Variable<String>(password);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      uuid: Value(uuid),
      username: Value(username),
      emailAddress: Value(emailAddress),
      password: Value(password),
    );
  }

  factory UsersDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersDB(
      uuid: serializer.fromJson<String>(json['uuid']),
      username: serializer.fromJson<String>(json['username']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'username': serializer.toJson<String>(username),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'password': serializer.toJson<String>(password),
    };
  }

  UsersDB copyWith(
          {String? uuid,
          String? username,
          String? emailAddress,
          String? password}) =>
      UsersDB(
        uuid: uuid ?? this.uuid,
        username: username ?? this.username,
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('UsersDB(')
          ..write('uuid: $uuid, ')
          ..write('username: $username, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, username, emailAddress, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersDB &&
          other.uuid == this.uuid &&
          other.username == this.username &&
          other.emailAddress == this.emailAddress &&
          other.password == this.password);
}

class UsersCompanion extends UpdateCompanion<UsersDB> {
  final Value<String> uuid;
  final Value<String> username;
  final Value<String> emailAddress;
  final Value<String> password;
  final Value<int> rowid;
  const UsersCompanion({
    this.uuid = const Value.absent(),
    this.username = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String uuid,
    required String username,
    required String emailAddress,
    required String password,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        username = Value(username),
        emailAddress = Value(emailAddress),
        password = Value(password);
  static Insertable<UsersDB> custom({
    Expression<String>? uuid,
    Expression<String>? username,
    Expression<String>? emailAddress,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (username != null) 'username': username,
      if (emailAddress != null) 'email_address': emailAddress,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? username,
      Value<String>? emailAddress,
      Value<String>? password,
      Value<int>? rowid}) {
    return UsersCompanion(
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (emailAddress.present) {
      map['email_address'] = Variable<String>(emailAddress.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('uuid: $uuid, ')
          ..write('username: $username, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('password: $password, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsTable extends Products
    with TableInfo<$ProductsTable, ProductDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
      'price', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _subCategoryMeta =
      const VerificationMeta('subCategory');
  @override
  late final GeneratedColumnWithTypeConverter<SubCategory, int> subCategory =
      GeneratedColumn<int>('sub_category', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<SubCategory>($ProductsTable.$convertersubCategory);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumnWithTypeConverter<Category, int> category =
      GeneratedColumn<int>('category', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<Category>($ProductsTable.$convertercategory);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, name, brand, description, price, subCategory, category, image];
  @override
  String get aliasedName => _alias ?? 'products';
  @override
  String get actualTableName => 'products';
  @override
  VerificationContext validateIntegrity(Insertable<ProductDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    context.handle(_subCategoryMeta, const VerificationResult.success());
    context.handle(_categoryMeta, const VerificationResult.success());
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  ProductDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductDB(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}price'])!,
      subCategory: $ProductsTable.$convertersubCategory.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sub_category'])!),
      category: $ProductsTable.$convertercategory.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category'])!),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SubCategory, int, int> $convertersubCategory =
      const EnumIndexConverter<SubCategory>(SubCategory.values);
  static JsonTypeConverter2<Category, int, int> $convertercategory =
      const EnumIndexConverter<Category>(Category.values);
}

class ProductDB extends DataClass implements Insertable<ProductDB> {
  final String uuid;
  final String name;
  final String brand;
  final String description;
  final int price;
  final SubCategory subCategory;
  final Category category;
  final String? image;
  const ProductDB(
      {required this.uuid,
      required this.name,
      required this.brand,
      required this.description,
      required this.price,
      required this.subCategory,
      required this.category,
      this.image});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['name'] = Variable<String>(name);
    map['brand'] = Variable<String>(brand);
    map['description'] = Variable<String>(description);
    map['price'] = Variable<int>(price);
    {
      final converter = $ProductsTable.$convertersubCategory;
      map['sub_category'] = Variable<int>(converter.toSql(subCategory));
    }
    {
      final converter = $ProductsTable.$convertercategory;
      map['category'] = Variable<int>(converter.toSql(category));
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      uuid: Value(uuid),
      name: Value(name),
      brand: Value(brand),
      description: Value(description),
      price: Value(price),
      subCategory: Value(subCategory),
      category: Value(category),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
    );
  }

  factory ProductDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductDB(
      uuid: serializer.fromJson<String>(json['uuid']),
      name: serializer.fromJson<String>(json['name']),
      brand: serializer.fromJson<String>(json['brand']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<int>(json['price']),
      subCategory: $ProductsTable.$convertersubCategory
          .fromJson(serializer.fromJson<int>(json['subCategory'])),
      category: $ProductsTable.$convertercategory
          .fromJson(serializer.fromJson<int>(json['category'])),
      image: serializer.fromJson<String?>(json['image']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'name': serializer.toJson<String>(name),
      'brand': serializer.toJson<String>(brand),
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<int>(price),
      'subCategory': serializer.toJson<int>(
          $ProductsTable.$convertersubCategory.toJson(subCategory)),
      'category': serializer
          .toJson<int>($ProductsTable.$convertercategory.toJson(category)),
      'image': serializer.toJson<String?>(image),
    };
  }

  ProductDB copyWith(
          {String? uuid,
          String? name,
          String? brand,
          String? description,
          int? price,
          SubCategory? subCategory,
          Category? category,
          Value<String?> image = const Value.absent()}) =>
      ProductDB(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        brand: brand ?? this.brand,
        description: description ?? this.description,
        price: price ?? this.price,
        subCategory: subCategory ?? this.subCategory,
        category: category ?? this.category,
        image: image.present ? image.value : this.image,
      );
  @override
  String toString() {
    return (StringBuffer('ProductDB(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('subCategory: $subCategory, ')
          ..write('category: $category, ')
          ..write('image: $image')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      uuid, name, brand, description, price, subCategory, category, image);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductDB &&
          other.uuid == this.uuid &&
          other.name == this.name &&
          other.brand == this.brand &&
          other.description == this.description &&
          other.price == this.price &&
          other.subCategory == this.subCategory &&
          other.category == this.category &&
          other.image == this.image);
}

class ProductsCompanion extends UpdateCompanion<ProductDB> {
  final Value<String> uuid;
  final Value<String> name;
  final Value<String> brand;
  final Value<String> description;
  final Value<int> price;
  final Value<SubCategory> subCategory;
  final Value<Category> category;
  final Value<String?> image;
  final Value<int> rowid;
  const ProductsCompanion({
    this.uuid = const Value.absent(),
    this.name = const Value.absent(),
    this.brand = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.subCategory = const Value.absent(),
    this.category = const Value.absent(),
    this.image = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String uuid,
    required String name,
    required String brand,
    required String description,
    required int price,
    required SubCategory subCategory,
    required Category category,
    this.image = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        brand = Value(brand),
        description = Value(description),
        price = Value(price),
        subCategory = Value(subCategory),
        category = Value(category);
  static Insertable<ProductDB> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<String>? description,
    Expression<int>? price,
    Expression<int>? subCategory,
    Expression<int>? category,
    Expression<String>? image,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (name != null) 'name': name,
      if (brand != null) 'brand': brand,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (subCategory != null) 'sub_category': subCategory,
      if (category != null) 'category': category,
      if (image != null) 'image': image,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? name,
      Value<String>? brand,
      Value<String>? description,
      Value<int>? price,
      Value<SubCategory>? subCategory,
      Value<Category>? category,
      Value<String?>? image,
      Value<int>? rowid}) {
    return ProductsCompanion(
      uuid: uuid ?? this.uuid,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      description: description ?? this.description,
      price: price ?? this.price,
      subCategory: subCategory ?? this.subCategory,
      category: category ?? this.category,
      image: image ?? this.image,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (subCategory.present) {
      final converter = $ProductsTable.$convertersubCategory;
      map['sub_category'] = Variable<int>(converter.toSql(subCategory.value));
    }
    if (category.present) {
      final converter = $ProductsTable.$convertercategory;
      map['category'] = Variable<int>(converter.toSql(category.value));
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('name: $name, ')
          ..write('brand: $brand, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('subCategory: $subCategory, ')
          ..write('category: $category, ')
          ..write('image: $image, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users, products];
}

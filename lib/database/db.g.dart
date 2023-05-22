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
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<String> number = GeneratedColumn<String>(
      'number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _userTypeMeta =
      const VerificationMeta('userType');
  @override
  late final GeneratedColumnWithTypeConverter<UserType, int> userType =
      GeneratedColumn<int>('user_type', aliasedName, false,
              type: DriftSqlType.int, requiredDuringInsert: true)
          .withConverter<UserType>($UsersTable.$converteruserType);
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, username, emailAddress, password, number, userType];
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
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    context.handle(_userTypeMeta, const VerificationResult.success());
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
      number: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}number']),
      userType: $UsersTable.$converteruserType.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_type'])!),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<UserType, int, int> $converteruserType =
      const EnumIndexConverter<UserType>(UserType.values);
}

class UsersDB extends DataClass implements Insertable<UsersDB> {
  final String uuid;
  final String username;
  final String emailAddress;
  final String password;
  final String? number;
  final UserType userType;
  const UsersDB(
      {required this.uuid,
      required this.username,
      required this.emailAddress,
      required this.password,
      this.number,
      required this.userType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['username'] = Variable<String>(username);
    map['email_address'] = Variable<String>(emailAddress);
    map['password'] = Variable<String>(password);
    if (!nullToAbsent || number != null) {
      map['number'] = Variable<String>(number);
    }
    {
      final converter = $UsersTable.$converteruserType;
      map['user_type'] = Variable<int>(converter.toSql(userType));
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      uuid: Value(uuid),
      username: Value(username),
      emailAddress: Value(emailAddress),
      password: Value(password),
      number:
          number == null && nullToAbsent ? const Value.absent() : Value(number),
      userType: Value(userType),
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
      number: serializer.fromJson<String?>(json['number']),
      userType: $UsersTable.$converteruserType
          .fromJson(serializer.fromJson<int>(json['userType'])),
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
      'number': serializer.toJson<String?>(number),
      'userType': serializer
          .toJson<int>($UsersTable.$converteruserType.toJson(userType)),
    };
  }

  UsersDB copyWith(
          {String? uuid,
          String? username,
          String? emailAddress,
          String? password,
          Value<String?> number = const Value.absent(),
          UserType? userType}) =>
      UsersDB(
        uuid: uuid ?? this.uuid,
        username: username ?? this.username,
        emailAddress: emailAddress ?? this.emailAddress,
        password: password ?? this.password,
        number: number.present ? number.value : this.number,
        userType: userType ?? this.userType,
      );
  @override
  String toString() {
    return (StringBuffer('UsersDB(')
          ..write('uuid: $uuid, ')
          ..write('username: $username, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('password: $password, ')
          ..write('number: $number, ')
          ..write('userType: $userType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, username, emailAddress, password, number, userType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersDB &&
          other.uuid == this.uuid &&
          other.username == this.username &&
          other.emailAddress == this.emailAddress &&
          other.password == this.password &&
          other.number == this.number &&
          other.userType == this.userType);
}

class UsersCompanion extends UpdateCompanion<UsersDB> {
  final Value<String> uuid;
  final Value<String> username;
  final Value<String> emailAddress;
  final Value<String> password;
  final Value<String?> number;
  final Value<UserType> userType;
  final Value<int> rowid;
  const UsersCompanion({
    this.uuid = const Value.absent(),
    this.username = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.password = const Value.absent(),
    this.number = const Value.absent(),
    this.userType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String uuid,
    required String username,
    required String emailAddress,
    required String password,
    this.number = const Value.absent(),
    required UserType userType,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        username = Value(username),
        emailAddress = Value(emailAddress),
        password = Value(password),
        userType = Value(userType);
  static Insertable<UsersDB> custom({
    Expression<String>? uuid,
    Expression<String>? username,
    Expression<String>? emailAddress,
    Expression<String>? password,
    Expression<String>? number,
    Expression<int>? userType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (username != null) 'username': username,
      if (emailAddress != null) 'email_address': emailAddress,
      if (password != null) 'password': password,
      if (number != null) 'number': number,
      if (userType != null) 'user_type': userType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? username,
      Value<String>? emailAddress,
      Value<String>? password,
      Value<String?>? number,
      Value<UserType>? userType,
      Value<int>? rowid}) {
    return UsersCompanion(
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      emailAddress: emailAddress ?? this.emailAddress,
      password: password ?? this.password,
      number: number ?? this.number,
      userType: userType ?? this.userType,
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
    if (number.present) {
      map['number'] = Variable<String>(number.value);
    }
    if (userType.present) {
      final converter = $UsersTable.$converteruserType;
      map['user_type'] = Variable<int>(converter.toSql(userType.value));
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
          ..write('number: $number, ')
          ..write('userType: $userType, ')
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
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        uuid,
        name,
        brand,
        description,
        price,
        subCategory,
        category,
        image,
        createdAt
      ];
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
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
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
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
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
  final DateTime createdAt;
  const ProductDB(
      {required this.uuid,
      required this.name,
      required this.brand,
      required this.description,
      required this.price,
      required this.subCategory,
      required this.category,
      this.image,
      required this.createdAt});
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
    map['created_at'] = Variable<DateTime>(createdAt);
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
      createdAt: Value(createdAt),
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
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
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
      'createdAt': serializer.toJson<DateTime>(createdAt),
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
          Value<String?> image = const Value.absent(),
          DateTime? createdAt}) =>
      ProductDB(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        brand: brand ?? this.brand,
        description: description ?? this.description,
        price: price ?? this.price,
        subCategory: subCategory ?? this.subCategory,
        category: category ?? this.category,
        image: image.present ? image.value : this.image,
        createdAt: createdAt ?? this.createdAt,
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
          ..write('image: $image, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, name, brand, description, price,
      subCategory, category, image, createdAt);
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
          other.image == this.image &&
          other.createdAt == this.createdAt);
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
  final Value<DateTime> createdAt;
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
    this.createdAt = const Value.absent(),
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
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        name = Value(name),
        brand = Value(brand),
        description = Value(description),
        price = Value(price),
        subCategory = Value(subCategory),
        category = Value(category),
        createdAt = Value(createdAt);
  static Insertable<ProductDB> custom({
    Expression<String>? uuid,
    Expression<String>? name,
    Expression<String>? brand,
    Expression<String>? description,
    Expression<int>? price,
    Expression<int>? subCategory,
    Expression<int>? category,
    Expression<String>? image,
    Expression<DateTime>? createdAt,
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
      if (createdAt != null) 'created_at': createdAt,
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
      Value<DateTime>? createdAt,
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
      createdAt: createdAt ?? this.createdAt,
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
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
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
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CartsTable extends Carts with TableInfo<$CartsTable, CartDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CartsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uuid, userId, productId];
  @override
  String get aliasedName => _alias ?? 'carts';
  @override
  String get actualTableName => 'carts';
  @override
  VerificationContext validateIntegrity(Insertable<CartDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  CartDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartDB(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
    );
  }

  @override
  $CartsTable createAlias(String alias) {
    return $CartsTable(attachedDatabase, alias);
  }
}

class CartDB extends DataClass implements Insertable<CartDB> {
  final String uuid;
  final String userId;
  final String productId;
  const CartDB(
      {required this.uuid, required this.userId, required this.productId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['user_id'] = Variable<String>(userId);
    map['product_id'] = Variable<String>(productId);
    return map;
  }

  CartsCompanion toCompanion(bool nullToAbsent) {
    return CartsCompanion(
      uuid: Value(uuid),
      userId: Value(userId),
      productId: Value(productId),
    );
  }

  factory CartDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartDB(
      uuid: serializer.fromJson<String>(json['uuid']),
      userId: serializer.fromJson<String>(json['userId']),
      productId: serializer.fromJson<String>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'userId': serializer.toJson<String>(userId),
      'productId': serializer.toJson<String>(productId),
    };
  }

  CartDB copyWith({String? uuid, String? userId, String? productId}) => CartDB(
        uuid: uuid ?? this.uuid,
        userId: userId ?? this.userId,
        productId: productId ?? this.productId,
      );
  @override
  String toString() {
    return (StringBuffer('CartDB(')
          ..write('uuid: $uuid, ')
          ..write('userId: $userId, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, userId, productId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartDB &&
          other.uuid == this.uuid &&
          other.userId == this.userId &&
          other.productId == this.productId);
}

class CartsCompanion extends UpdateCompanion<CartDB> {
  final Value<String> uuid;
  final Value<String> userId;
  final Value<String> productId;
  final Value<int> rowid;
  const CartsCompanion({
    this.uuid = const Value.absent(),
    this.userId = const Value.absent(),
    this.productId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CartsCompanion.insert({
    required String uuid,
    required String userId,
    required String productId,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        userId = Value(userId),
        productId = Value(productId);
  static Insertable<CartDB> custom({
    Expression<String>? uuid,
    Expression<String>? userId,
    Expression<String>? productId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (userId != null) 'user_id': userId,
      if (productId != null) 'product_id': productId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CartsCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? userId,
      Value<String>? productId,
      Value<int>? rowid}) {
    return CartsCompanion(
      uuid: uuid ?? this.uuid,
      userId: userId ?? this.userId,
      productId: productId ?? this.productId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('userId: $userId, ')
          ..write('productId: $productId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentCardsTable extends PaymentCards
    with TableInfo<$PaymentCardsTable, CardDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _expiryDateMeta =
      const VerificationMeta('expiryDate');
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
      'expiry_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _cardHolderMeta =
      const VerificationMeta('cardHolder');
  @override
  late final GeneratedColumn<String> cardHolder = GeneratedColumn<String>(
      'card_holder', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cardNumberMeta =
      const VerificationMeta('cardNumber');
  @override
  late final GeneratedColumn<String> cardNumber = GeneratedColumn<String>(
      'card_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cvvMeta = const VerificationMeta('cvv');
  @override
  late final GeneratedColumn<String> cvv = GeneratedColumn<String>(
      'cvv', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [uuid, userId, expiryDate, cardHolder, cardNumber, cvv];
  @override
  String get aliasedName => _alias ?? 'payment_cards';
  @override
  String get actualTableName => 'payment_cards';
  @override
  VerificationContext validateIntegrity(Insertable<CardDB> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date']!, _expiryDateMeta));
    } else if (isInserting) {
      context.missing(_expiryDateMeta);
    }
    if (data.containsKey('card_holder')) {
      context.handle(
          _cardHolderMeta,
          cardHolder.isAcceptableOrUnknown(
              data['card_holder']!, _cardHolderMeta));
    } else if (isInserting) {
      context.missing(_cardHolderMeta);
    }
    if (data.containsKey('card_number')) {
      context.handle(
          _cardNumberMeta,
          cardNumber.isAcceptableOrUnknown(
              data['card_number']!, _cardNumberMeta));
    } else if (isInserting) {
      context.missing(_cardNumberMeta);
    }
    if (data.containsKey('cvv')) {
      context.handle(
          _cvvMeta, cvv.isAcceptableOrUnknown(data['cvv']!, _cvvMeta));
    } else if (isInserting) {
      context.missing(_cvvMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  CardDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardDB(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      expiryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiry_date'])!,
      cardHolder: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_holder'])!,
      cardNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}card_number'])!,
      cvv: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cvv'])!,
    );
  }

  @override
  $PaymentCardsTable createAlias(String alias) {
    return $PaymentCardsTable(attachedDatabase, alias);
  }
}

class CardDB extends DataClass implements Insertable<CardDB> {
  final String uuid;
  final String userId;
  final DateTime expiryDate;
  final String cardHolder;
  final String cardNumber;
  final String cvv;
  const CardDB(
      {required this.uuid,
      required this.userId,
      required this.expiryDate,
      required this.cardHolder,
      required this.cardNumber,
      required this.cvv});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['user_id'] = Variable<String>(userId);
    map['expiry_date'] = Variable<DateTime>(expiryDate);
    map['card_holder'] = Variable<String>(cardHolder);
    map['card_number'] = Variable<String>(cardNumber);
    map['cvv'] = Variable<String>(cvv);
    return map;
  }

  PaymentCardsCompanion toCompanion(bool nullToAbsent) {
    return PaymentCardsCompanion(
      uuid: Value(uuid),
      userId: Value(userId),
      expiryDate: Value(expiryDate),
      cardHolder: Value(cardHolder),
      cardNumber: Value(cardNumber),
      cvv: Value(cvv),
    );
  }

  factory CardDB.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardDB(
      uuid: serializer.fromJson<String>(json['uuid']),
      userId: serializer.fromJson<String>(json['userId']),
      expiryDate: serializer.fromJson<DateTime>(json['expiryDate']),
      cardHolder: serializer.fromJson<String>(json['cardHolder']),
      cardNumber: serializer.fromJson<String>(json['cardNumber']),
      cvv: serializer.fromJson<String>(json['cvv']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'userId': serializer.toJson<String>(userId),
      'expiryDate': serializer.toJson<DateTime>(expiryDate),
      'cardHolder': serializer.toJson<String>(cardHolder),
      'cardNumber': serializer.toJson<String>(cardNumber),
      'cvv': serializer.toJson<String>(cvv),
    };
  }

  CardDB copyWith(
          {String? uuid,
          String? userId,
          DateTime? expiryDate,
          String? cardHolder,
          String? cardNumber,
          String? cvv}) =>
      CardDB(
        uuid: uuid ?? this.uuid,
        userId: userId ?? this.userId,
        expiryDate: expiryDate ?? this.expiryDate,
        cardHolder: cardHolder ?? this.cardHolder,
        cardNumber: cardNumber ?? this.cardNumber,
        cvv: cvv ?? this.cvv,
      );
  @override
  String toString() {
    return (StringBuffer('CardDB(')
          ..write('uuid: $uuid, ')
          ..write('userId: $userId, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('cardHolder: $cardHolder, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('cvv: $cvv')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(uuid, userId, expiryDate, cardHolder, cardNumber, cvv);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardDB &&
          other.uuid == this.uuid &&
          other.userId == this.userId &&
          other.expiryDate == this.expiryDate &&
          other.cardHolder == this.cardHolder &&
          other.cardNumber == this.cardNumber &&
          other.cvv == this.cvv);
}

class PaymentCardsCompanion extends UpdateCompanion<CardDB> {
  final Value<String> uuid;
  final Value<String> userId;
  final Value<DateTime> expiryDate;
  final Value<String> cardHolder;
  final Value<String> cardNumber;
  final Value<String> cvv;
  final Value<int> rowid;
  const PaymentCardsCompanion({
    this.uuid = const Value.absent(),
    this.userId = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.cardHolder = const Value.absent(),
    this.cardNumber = const Value.absent(),
    this.cvv = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentCardsCompanion.insert({
    required String uuid,
    required String userId,
    required DateTime expiryDate,
    required String cardHolder,
    required String cardNumber,
    required String cvv,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        userId = Value(userId),
        expiryDate = Value(expiryDate),
        cardHolder = Value(cardHolder),
        cardNumber = Value(cardNumber),
        cvv = Value(cvv);
  static Insertable<CardDB> custom({
    Expression<String>? uuid,
    Expression<String>? userId,
    Expression<DateTime>? expiryDate,
    Expression<String>? cardHolder,
    Expression<String>? cardNumber,
    Expression<String>? cvv,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (userId != null) 'user_id': userId,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (cardHolder != null) 'card_holder': cardHolder,
      if (cardNumber != null) 'card_number': cardNumber,
      if (cvv != null) 'cvv': cvv,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentCardsCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? userId,
      Value<DateTime>? expiryDate,
      Value<String>? cardHolder,
      Value<String>? cardNumber,
      Value<String>? cvv,
      Value<int>? rowid}) {
    return PaymentCardsCompanion(
      uuid: uuid ?? this.uuid,
      userId: userId ?? this.userId,
      expiryDate: expiryDate ?? this.expiryDate,
      cardHolder: cardHolder ?? this.cardHolder,
      cardNumber: cardNumber ?? this.cardNumber,
      cvv: cvv ?? this.cvv,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (cardHolder.present) {
      map['card_holder'] = Variable<String>(cardHolder.value);
    }
    if (cardNumber.present) {
      map['card_number'] = Variable<String>(cardNumber.value);
    }
    if (cvv.present) {
      map['cvv'] = Variable<String>(cvv.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentCardsCompanion(')
          ..write('uuid: $uuid, ')
          ..write('userId: $userId, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('cardHolder: $cardHolder, ')
          ..write('cardNumber: $cardNumber, ')
          ..write('cvv: $cvv, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $CartsTable carts = $CartsTable(this);
  late final $PaymentCardsTable paymentCards = $PaymentCardsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [users, products, carts, paymentCards];
}

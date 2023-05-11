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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [users];
}

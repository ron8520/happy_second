// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
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
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailAddressMeta =
      const VerificationMeta('emailAddress');
  @override
  late final GeneratedColumn<String> emailAddress = GeneratedColumn<String>(
      'email_address', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [uuid, username, emailAddress];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      emailAddress: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email_address'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final String uuid;
  final String username;
  final String emailAddress;
  const User(
      {required this.uuid, required this.username, required this.emailAddress});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['username'] = Variable<String>(username);
    map['email_address'] = Variable<String>(emailAddress);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      uuid: Value(uuid),
      username: Value(username),
      emailAddress: Value(emailAddress),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      uuid: serializer.fromJson<String>(json['uuid']),
      username: serializer.fromJson<String>(json['username']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'username': serializer.toJson<String>(username),
      'emailAddress': serializer.toJson<String>(emailAddress),
    };
  }

  User copyWith({String? uuid, String? username, String? emailAddress}) => User(
        uuid: uuid ?? this.uuid,
        username: username ?? this.username,
        emailAddress: emailAddress ?? this.emailAddress,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('uuid: $uuid, ')
          ..write('username: $username, ')
          ..write('emailAddress: $emailAddress')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, username, emailAddress);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.uuid == this.uuid &&
          other.username == this.username &&
          other.emailAddress == this.emailAddress);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<String> uuid;
  final Value<String> username;
  final Value<String> emailAddress;
  final Value<int> rowid;
  const UsersCompanion({
    this.uuid = const Value.absent(),
    this.username = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersCompanion.insert({
    required String uuid,
    required String username,
    required String emailAddress,
    this.rowid = const Value.absent(),
  })  : uuid = Value(uuid),
        username = Value(username),
        emailAddress = Value(emailAddress);
  static Insertable<User> custom({
    Expression<String>? uuid,
    Expression<String>? username,
    Expression<String>? emailAddress,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (username != null) 'username': username,
      if (emailAddress != null) 'email_address': emailAddress,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersCompanion copyWith(
      {Value<String>? uuid,
      Value<String>? username,
      Value<String>? emailAddress,
      Value<int>? rowid}) {
    return UsersCompanion(
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      emailAddress: emailAddress ?? this.emailAddress,
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

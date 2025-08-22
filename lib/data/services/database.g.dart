// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $KeyValueStoreTable extends KeyValueStore
    with TableInfo<$KeyValueStoreTable, KeyValueEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $KeyValueStoreTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _requestKeyMeta = const VerificationMeta(
    'requestKey',
  );
  @override
  late final GeneratedColumn<String> requestKey = GeneratedColumn<String>(
    'request_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE NOT NULL',
  );
  static const VerificationMeta _jsonResponseMeta = const VerificationMeta(
    'jsonResponse',
  );
  @override
  late final GeneratedColumn<String> jsonResponse = GeneratedColumn<String>(
    'json_response',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [requestKey, jsonResponse];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'key_value_store';
  @override
  VerificationContext validateIntegrity(
    Insertable<KeyValueEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('request_key')) {
      context.handle(
        _requestKeyMeta,
        requestKey.isAcceptableOrUnknown(data['request_key']!, _requestKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_requestKeyMeta);
    }
    if (data.containsKey('json_response')) {
      context.handle(
        _jsonResponseMeta,
        jsonResponse.isAcceptableOrUnknown(
          data['json_response']!,
          _jsonResponseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_jsonResponseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {requestKey};
  @override
  KeyValueEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return KeyValueEntry(
      requestKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}request_key'],
      )!,
      jsonResponse: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}json_response'],
      )!,
    );
  }

  @override
  $KeyValueStoreTable createAlias(String alias) {
    return $KeyValueStoreTable(attachedDatabase, alias);
  }
}

class KeyValueEntry extends DataClass implements Insertable<KeyValueEntry> {
  final String requestKey;
  final String jsonResponse;
  const KeyValueEntry({required this.requestKey, required this.jsonResponse});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['request_key'] = Variable<String>(requestKey);
    map['json_response'] = Variable<String>(jsonResponse);
    return map;
  }

  KeyValueStoreCompanion toCompanion(bool nullToAbsent) {
    return KeyValueStoreCompanion(
      requestKey: Value(requestKey),
      jsonResponse: Value(jsonResponse),
    );
  }

  factory KeyValueEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return KeyValueEntry(
      requestKey: serializer.fromJson<String>(json['requestKey']),
      jsonResponse: serializer.fromJson<String>(json['jsonResponse']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'requestKey': serializer.toJson<String>(requestKey),
      'jsonResponse': serializer.toJson<String>(jsonResponse),
    };
  }

  KeyValueEntry copyWith({String? requestKey, String? jsonResponse}) =>
      KeyValueEntry(
        requestKey: requestKey ?? this.requestKey,
        jsonResponse: jsonResponse ?? this.jsonResponse,
      );
  KeyValueEntry copyWithCompanion(KeyValueStoreCompanion data) {
    return KeyValueEntry(
      requestKey: data.requestKey.present
          ? data.requestKey.value
          : this.requestKey,
      jsonResponse: data.jsonResponse.present
          ? data.jsonResponse.value
          : this.jsonResponse,
    );
  }

  @override
  String toString() {
    return (StringBuffer('KeyValueEntry(')
          ..write('requestKey: $requestKey, ')
          ..write('jsonResponse: $jsonResponse')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(requestKey, jsonResponse);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is KeyValueEntry &&
          other.requestKey == this.requestKey &&
          other.jsonResponse == this.jsonResponse);
}

class KeyValueStoreCompanion extends UpdateCompanion<KeyValueEntry> {
  final Value<String> requestKey;
  final Value<String> jsonResponse;
  final Value<int> rowid;
  const KeyValueStoreCompanion({
    this.requestKey = const Value.absent(),
    this.jsonResponse = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  KeyValueStoreCompanion.insert({
    required String requestKey,
    required String jsonResponse,
    this.rowid = const Value.absent(),
  }) : requestKey = Value(requestKey),
       jsonResponse = Value(jsonResponse);
  static Insertable<KeyValueEntry> custom({
    Expression<String>? requestKey,
    Expression<String>? jsonResponse,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (requestKey != null) 'request_key': requestKey,
      if (jsonResponse != null) 'json_response': jsonResponse,
      if (rowid != null) 'rowid': rowid,
    });
  }

  KeyValueStoreCompanion copyWith({
    Value<String>? requestKey,
    Value<String>? jsonResponse,
    Value<int>? rowid,
  }) {
    return KeyValueStoreCompanion(
      requestKey: requestKey ?? this.requestKey,
      jsonResponse: jsonResponse ?? this.jsonResponse,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (requestKey.present) {
      map['request_key'] = Variable<String>(requestKey.value);
    }
    if (jsonResponse.present) {
      map['json_response'] = Variable<String>(jsonResponse.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('KeyValueStoreCompanion(')
          ..write('requestKey: $requestKey, ')
          ..write('jsonResponse: $jsonResponse, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $KeyValueStoreTable keyValueStore = $KeyValueStoreTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [keyValueStore];
}

typedef $$KeyValueStoreTableCreateCompanionBuilder =
    KeyValueStoreCompanion Function({
      required String requestKey,
      required String jsonResponse,
      Value<int> rowid,
    });
typedef $$KeyValueStoreTableUpdateCompanionBuilder =
    KeyValueStoreCompanion Function({
      Value<String> requestKey,
      Value<String> jsonResponse,
      Value<int> rowid,
    });

class $$KeyValueStoreTableFilterComposer
    extends Composer<_$Database, $KeyValueStoreTable> {
  $$KeyValueStoreTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get requestKey => $composableBuilder(
    column: $table.requestKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get jsonResponse => $composableBuilder(
    column: $table.jsonResponse,
    builder: (column) => ColumnFilters(column),
  );
}

class $$KeyValueStoreTableOrderingComposer
    extends Composer<_$Database, $KeyValueStoreTable> {
  $$KeyValueStoreTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get requestKey => $composableBuilder(
    column: $table.requestKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get jsonResponse => $composableBuilder(
    column: $table.jsonResponse,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$KeyValueStoreTableAnnotationComposer
    extends Composer<_$Database, $KeyValueStoreTable> {
  $$KeyValueStoreTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get requestKey => $composableBuilder(
    column: $table.requestKey,
    builder: (column) => column,
  );

  GeneratedColumn<String> get jsonResponse => $composableBuilder(
    column: $table.jsonResponse,
    builder: (column) => column,
  );
}

class $$KeyValueStoreTableTableManager
    extends
        RootTableManager<
          _$Database,
          $KeyValueStoreTable,
          KeyValueEntry,
          $$KeyValueStoreTableFilterComposer,
          $$KeyValueStoreTableOrderingComposer,
          $$KeyValueStoreTableAnnotationComposer,
          $$KeyValueStoreTableCreateCompanionBuilder,
          $$KeyValueStoreTableUpdateCompanionBuilder,
          (
            KeyValueEntry,
            BaseReferences<_$Database, $KeyValueStoreTable, KeyValueEntry>,
          ),
          KeyValueEntry,
          PrefetchHooks Function()
        > {
  $$KeyValueStoreTableTableManager(_$Database db, $KeyValueStoreTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$KeyValueStoreTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$KeyValueStoreTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$KeyValueStoreTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> requestKey = const Value.absent(),
                Value<String> jsonResponse = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => KeyValueStoreCompanion(
                requestKey: requestKey,
                jsonResponse: jsonResponse,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String requestKey,
                required String jsonResponse,
                Value<int> rowid = const Value.absent(),
              }) => KeyValueStoreCompanion.insert(
                requestKey: requestKey,
                jsonResponse: jsonResponse,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$KeyValueStoreTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $KeyValueStoreTable,
      KeyValueEntry,
      $$KeyValueStoreTableFilterComposer,
      $$KeyValueStoreTableOrderingComposer,
      $$KeyValueStoreTableAnnotationComposer,
      $$KeyValueStoreTableCreateCompanionBuilder,
      $$KeyValueStoreTableUpdateCompanionBuilder,
      (
        KeyValueEntry,
        BaseReferences<_$Database, $KeyValueStoreTable, KeyValueEntry>,
      ),
      KeyValueEntry,
      PrefetchHooks Function()
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$KeyValueStoreTableTableManager get keyValueStore =>
      $$KeyValueStoreTableTableManager(_db, _db.keyValueStore);
}

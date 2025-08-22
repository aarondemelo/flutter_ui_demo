// lib/database/tables.dart
import 'package:drift/drift.dart';

// New table for API response caching
@DataClassName('KeyValueEntry')
class KeyValueStore extends Table {
  TextColumn get requestKey => text().customConstraint('UNIQUE NOT NULL')(); // API request URL
  TextColumn get jsonResponse => text()(); // Full JSON response string

  @override
  Set<Column> get primaryKey => {requestKey}; // requestKey is the primary key
}
import 'dart:convert';

import '../data/models/dto.dart';
import '../data/services/api_service.dart';
import '../data/services/database.dart';

abstract class ProductRepository {
  Stream<ProductResponse> getProducts() async* {
    throw UnimplementedError();
  }
}

class ProductRepositoryImpl implements ProductRepository {
  final Database database;
  final ApiService apiService;

  ProductRepositoryImpl({required this.database, required this.apiService});

  static const String _productsKey = 'products_list';

  Stream<ProductResponse> getProducts() async* {
    // 1. Check and emit the cached response immediately (if it exists).
    final cachedEntry = await (database.select(database.keyValueStore)
      ..where((tbl) => tbl.requestKey.equals(_productsKey)))
        .getSingleOrNull();

    if (cachedEntry != null) {
      final jsonResponse = jsonDecode(cachedEntry.jsonResponse);
      yield ProductResponse.fromJson(jsonResponse);
    }

    // 2. Fetch the new data from the API.
    try {
      final productResponse = await apiService.getProducts();

      // 3. Update the cache with the new data.
 final jsonString = jsonEncode(productResponse.toJson());

await database.into(database.keyValueStore).insertOnConflictUpdate(
  KeyValueStoreCompanion.insert(
    requestKey: _productsKey,
    jsonResponse: jsonString,
  ),
);

      // 4. Emit the new API response.
      yield productResponse;
    } catch (e) {
      // Handle API errors if necessary, but don't stop the stream
      // from completing if a cache was already emitted.
      print('Failed to fetch from API: $e');
    }
  }
}
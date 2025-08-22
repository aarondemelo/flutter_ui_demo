import 'package:flutter/material.dart';
import 'package:flutter_ui_demo/app/app.dart';
import 'package:flutter_ui_demo/bootstrap.dart';
import 'package:flutter_ui_demo/data/services/api_service_impl.dart';
import 'package:flutter_ui_demo/data/services/database.dart';
import 'package:flutter_ui_demo/domain/product_repository.dart';
import 'package:get_it/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final database = Database();
  final apiService  = ApiServiceImpl();

  GetIt.I.registerSingleton<ProductRepository>(ProductRepositoryImpl(database: database, apiService: apiService));
  bootstrap(() => const App());
}

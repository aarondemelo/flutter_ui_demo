import 'package:dio/dio.dart';
import 'package:flutter_ui_demo/data/models/dto.dart';

abstract class ApiService {

  Future<ProductResponse> getProducts();
}
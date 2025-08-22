import 'package:dio/dio.dart';
import 'package:flutter_ui_demo/data/services/api_service.dart';
import '../models/dto.dart';

class ApiServiceImpl extends ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://dummyjson.com'; // Using a public API for demonstration

  // GET request
  Future<Response> getRequest(String endpoint) async {
    try {
      final response = await _dio.get('$_baseUrl$endpoint');
      return response;
    } on DioException catch (e) {
      // Handle Dio-specific errors
      _handleDioError(e);
      rethrow; // Re-throw the exception for the calling function to handle
    } catch (e) {
      // Handle other types of errors
      print('An unexpected error occurred: $e');
      rethrow;
    }
  }

  // POST request
  Future<Response> postRequest(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('$_baseUrl/$endpoint', data: data);
      return response;
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    } catch (e) {
      print('An unexpected error occurred: $e');
      rethrow;
    }
  }

  void _handleDioError(DioException e) {
    if (e.response != null) {
      // The server responded with a status code other than 2xx
      print('Server error: ${e.response?.statusCode}');
      print('Data: ${e.response?.data}');
    } else {
      // No response received from the server (e.g., network error)
      print('Network error: ${e.message}');
    }
  }

  @override
  Future<ProductResponse> getProducts() async {
    try {
      // Make the GET request to the 'products' endpoint
      final response = await getRequest('/products');

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the JSON data into a ProductResponse object
        return ProductResponse.fromJson(response.data);
      } else {
        // If the status code is not 200, throw an exception
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
          error: 'Failed to load products with status code: ${response.statusCode}',
        );
      }
    } on DioException {
      rethrow; // Re-throw the DioException that was already handled
    } catch (e) {
      // Catch any other unexpected errors
      print('Error fetching products: $e');
      rethrow;
    }
  }
}
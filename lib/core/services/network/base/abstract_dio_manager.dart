import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool success;

  ApiResponse({this.data, this.message, required this.success});
  factory ApiResponse.success(T data) {
    return ApiResponse<T>(data: data, success: true);
  }
  factory ApiResponse.error(String message) {
    return ApiResponse<T>(message: message, success: false);
  }
}

class HttpMethod {
  static final HttpMethod _instance = HttpMethod._internal();

  factory HttpMethod() => _instance;

  HttpMethod._internal();

  final String baseUrl = 'http://10.0.2.2:8001/';

  Map<String, String> get defaultHeaders => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  Future<ApiResponse<T>> get<T>(
    String endpoint,
    T Function(dynamic json) fromJson,
  ) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl'),
        headers: defaultHeaders,
      );
      print(response.body);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ApiResponse.success(fromJson(jsonData));
      } else {
        return ApiResponse.error('GET failed: ${response.statusCode}');
      }
    } catch (e) {
      return ApiResponse.error('GET exception: $e');
    }
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint,
    dynamic body,
    T Function(dynamic json) fromJson,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$endpoint'),
        headers: defaultHeaders,
        body: json.encode(body),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final jsonData = json.decode(response.body);
        return ApiResponse.success(fromJson(jsonData));
      } else {
        return ApiResponse.error('POST failed: ${response.statusCode}');
      }
    } catch (e) {
      return ApiResponse.error('POST exception: $e');
    }
  }

  Future<ApiResponse<T>> put<T>(
    String endpoint,
    dynamic body,
    T Function(dynamic json) fromJson,
  ) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$endpoint'),
        headers: defaultHeaders,
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ApiResponse.success(fromJson(jsonData));
      } else {
        return ApiResponse.error('PUT failed: ${response.statusCode}');
      }
    } catch (e) {
      return ApiResponse.error('PUT exception: $e');
    }
  }

  Future<ApiResponse<T>> delete<T>(
    String endpoint,
    T Function(dynamic json) fromJson,
  ) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$endpoint'),
        headers: defaultHeaders,
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return ApiResponse.success(fromJson(jsonData));
      } else {
        return ApiResponse.error('DELETE failed: ${response.statusCode}');
      }
    } catch (e) {
      return ApiResponse.error('DELETE exception: $e');
    }
  }
}

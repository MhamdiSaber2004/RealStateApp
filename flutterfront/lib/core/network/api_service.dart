import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_exceptions.dart';

class ApiService {
  static const String baseUrl = "https://your-backend-url.com/api";

  String? token; // optional JWT token

  // Set token after login
  void setToken(String newToken) {
    token = newToken;
  }

  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  // ---------- GET ----------
  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.get(url, headers: _headers());
      return _processResponse(response);
    } catch (e) {
      throw FetchDataException("No internet connection");
    }
  }

  // ---------- POST ----------
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? data}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.post(
        url,
        headers: _headers(),
        body: jsonEncode(data),
      );
      return _processResponse(response);
    } catch (e) {
      throw FetchDataException("No internet connection");
    }
  }

  // ---------- PUT ----------
  Future<dynamic> put(String endpoint, {Map<String, dynamic>? data}) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.put(
        url,
        headers: _headers(),
        body: jsonEncode(data),
      );
      return _processResponse(response);
    } catch (e) {
      throw FetchDataException("No internet connection");
    }
  }

  // ---------- DELETE ----------
  Future<dynamic> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.delete(url, headers: _headers());
      return _processResponse(response);
    } catch (e) {
      throw FetchDataException("No internet connection");
    }
  }

  // ---------- Response handler ----------
  dynamic _processResponse(http.Response response) {
    final body = response.body.isNotEmpty ? jsonDecode(response.body) : null;

    switch (response.statusCode) {
      case 200:
      case 201:
        return body;

      case 400:
        throw BadRequestException(body?['message'] ?? "Bad request");

      case 401:
        throw UnauthorisedException(body?['message'] ?? "Unauthorized");

      case 403:
        throw UnauthorisedException(body?['message'] ?? "Forbidden");

      case 404:
        throw ResourceNotFoundException("Not found");

      case 500:
      default:
        throw FetchDataException(
            "Server error: ${response.statusCode} ${body.toString()}");
    }
  }
}

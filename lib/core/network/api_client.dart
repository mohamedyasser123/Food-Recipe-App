import 'dart:convert';
import 'package:http/http.dart' as http;
import '../error/exceptions.dart';
class ApiClient {
  final http.Client client;
  ApiClient({required this.client});

  Future<dynamic> get(String url) async {
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ServerException(message: "Failed to fetch data");
    }
  }
}
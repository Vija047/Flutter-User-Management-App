import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String baseUrl = 'https://dummyjson.com';

  Future<Map<String, dynamic>> getUsers({
    int limit = 10,
    int skip = 0,
    String? search,
  }) async {
    final url =
        search != null
            ? '$baseUrl/users/search?q=$search&limit=$limit&skip=$skip'
            : '$baseUrl/users?limit=$limit&skip=$skip';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Map<String, dynamic>> getUserPosts(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/user/$userId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user posts');
    }
  }

  Future<Map<String, dynamic>> getUserTodos(int userId) async {
    final response = await http.get(Uri.parse('$baseUrl/todos/user/$userId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load user todos');
    }
  }
}

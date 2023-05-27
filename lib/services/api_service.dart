import 'dart:convert';

import '../model/model.dart';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {

  static Future<List<PostsModel>> fetchPosts() async {
    // final url = Uri.parse('$BASE_URL/v1/user-get');
    final url = Uri.parse('$BASE_URL/$GET_POST');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      List<PostsModel> posts =
      jsonData.map((data) => PostsModel.fromJson(data)).toList();
    print(posts);
      return posts;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
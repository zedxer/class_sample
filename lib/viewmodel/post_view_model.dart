
import 'package:flutter/cupertino.dart';

import '../services/api_service.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class PostViewModel extends ChangeNotifier {

  List<PostsModel> _posts2 = [];
  List<PostsModel> get posts2 => _posts2;

  Future<void> fetchPosts() async {
    try {
      List<PostsModel> fetchedPosts = await ApiService.fetchPosts();
      _posts2 = fetchedPosts;
      print("object");
      notifyListeners();
    } catch (e) {
      // Handle error
      print(e);
    }
  }
}
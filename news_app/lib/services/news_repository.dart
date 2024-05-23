

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../models/headlines_model.dart';

class NewsRepository {

  Future<HeadlinesModel> fetchHeadlinesApi() async {
    String url = "https://newsapi.org/v2/everything?q=cricket&sortBy=publishedAt&apiKey=f217beb8b57140f79bf1a442777bc85f";
    print(url);
    // "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=42b557ea6d0e4bf18997232c48e4db5e";


    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return HeadlinesModel.fromJson(body);
    }
    throw Exception("Error");
  }
}


import '../models/headlines_model.dart';
import '../services/news_repository.dart';

class NewsViewModel {
  final _rep  = NewsRepository();

  Future<HeadlinesModel> fetchHeadlinesApi() async {
    final response = await _rep.fetchHeadlinesApi();
    return response;
  }

  //Future<CategoriesNewsModel>fetchCategoriesNewsApi(String category) async {
    //final response = await _rep.fetchCategoriesNewsApi(category);
    //return response;
  //}
}
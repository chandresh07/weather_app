

import 'dart:convert';
import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews()async{
    String url = f"https://newsapi.org/v2/everything?q=cricket&sortBy=publishedAt&apiKey=f217beb8b57140f79bf1a442777bc85f";
   var response = await http.get(Uri.parse(url));

   var jsonData = jsonDecode(response.body);

   if(jsonData['status']=='ok'){
     jsonData["aricles"].forEach((element){

       if(element["urlToImage"]!= null && element['description']!= null){
         ArticleModel articleModel = ArticleModel(
           title: element["title"],
           description: element["description"],
           url: element['url'],
           urlToImage: element["urlToImage"],
           content: element['content'],
           author: element["author"],
         );
         news.add(articleModel);
       }
     });
   }
  }
}
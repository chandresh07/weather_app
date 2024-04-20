

import 'dart:convert';
import 'package:news_app/models/slider_model.dart';
import 'package:http/http.dart' as http;

class Sliders{
  List<sliderModel> sliders = [];

  Future<void> getSliders()async{
    String url = "https://newsapi.org/v2/everything?q=cricket&sortBy=publishedAt&apiKey=f217beb8b57140f79bf1a442777bc85f";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if(jsonData['status']=='ok'){
      jsonData["aricles"].forEach((element){

        if(element["urlToImage"]!= null && element['description']!= null){
          sliderModel slidermodel = sliderModel(
            title: element["title"],
            description: element["description"],
            url: element['url'],
            urlToImage: element["urlToImage"],
            content: element['content'],
            author: element["author"],
          );
          sliders.add(slidermodel);
        }
      });
    }
  }
}
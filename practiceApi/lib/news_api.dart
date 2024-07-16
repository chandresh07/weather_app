import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practiceapi/models/NewsApiModel.dart';


class view extends StatefulWidget {
  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  Future<NewsApiModel> getapi() async {
    final reponse = await http.get(
        Uri.parse("https://newsapi.org/v2/everything?q=cricket&sortBy=publishedAt&apiKey=f217beb8b57140f79bf1a442777bc85f"));
   var data = jsonDecode(reponse.body.toString());
    if(kDebugMode){
      print(reponse.body);
    }
    if(reponse.statusCode == 200){
      return NewsApiModel.fromJson(data);
    }else{
      return NewsApiModel.fromJson(data);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<NewsApiModel>(
        future: getapi(),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                return Column(
                  children: [
                    ListTile(
                      title:Text(snapshot.data!.articles![index].source!.id.toString()),
                      leading:CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data!.articles![index].urlToImage.toString()),),
                  subtitle:Text(snapshot.data!.articles![index].source!.name.toString()) ,
                      trailing: Text(snapshot.data!.articles![index].author.toString()) ,


                    )
                  ],

                );

                });
          }
        },
      ),
    );
  }}

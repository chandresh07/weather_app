import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/posts_model.dart';


// Api calling when the data is in the array and do not have a name

class PostsApi extends StatefulWidget {
  @override
  State<PostsApi> createState() => _PostsApiState();
}

class _PostsApiState extends State<PostsApi> {

  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostApi ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learnig Api"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context,snapshot) {
                if(!snapshot.hasData){
                  return CircularProgressIndicator();
                }
                else {
                  return ListView.builder(
                      itemCount: postList.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context,index){
                        return Column(
                          children: [
                           Card(
                             child: ListTile(
                               leading: Text(postList[index].id.toString()),
                               title: Text('title : '+postList[index].title.toString()),
                              subtitle : Text('body : '+postList[index].body.toString()),
                             ),
                           )
                          ],
                        );
                      }
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }}

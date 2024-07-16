import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


// Api calling without making the model

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var data;
  Future<void> getapi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    if (kDebugMode) {
      print(response.body);
    }
    if(response.statusCode == 200) {
       data = jsonDecode(response.body.toString());
    }else{

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getapi(),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
          else {
            return ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
            return Column(
            children: [
            Card(child: Text(data[index]['title'].toString())),
              Divider(),
            ],
            );
            }
            );
          }
        },
      ),
    );
  }}

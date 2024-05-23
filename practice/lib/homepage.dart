
import 'package:flutter/material.dart';

class homePage extends StatefulWidget {  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var arrnames = ['raman', 'rajesh', 'vijay', 'chandresh', 'raju', 'yogesh', 'ravindra'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo page"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: arrnames.length,
        separatorBuilder: (context,index){
          return Divider(
            height: 100,
              thickness: 1,
          );
        },
        itemBuilder: (Buildcontext,int index){
          return ListTile(
            leading: Text("${index+1}"),
            title: Text(arrnames[index]),
            subtitle: Text("Number"),
            trailing: Icon(Icons.account_circle),

          );
        },

      ),
    );
  }}

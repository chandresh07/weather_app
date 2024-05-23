
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pagination/main.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;


class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var data;
  Future<void> GetPhotosApi()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200){
      data = jsonDecode(response.body.toString());
    }else{

    }
  }
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Leaderboard",style: TextStyle(color: Colors.white),),
        leading: CircleAvatar(
          backgroundColor: Colors.black38,
          child: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu,color: Colors.white,),
          ),
        ),
        actions: [
          CircleAvatar(
              backgroundColor:Colors.black,
            child: IconButton(onPressed: (){}, icon: Icon(Ionicons.search,color: Colors.white,))),

          CircleAvatar(
              backgroundColor:Colors.black,
              child: IconButton(onPressed: (){}, icon: Icon(Ionicons.arrow_down,color: Colors.white,)))
        ],
      ),
      bottomNavigationBar:
      BottomNavigationBar(
       backgroundColor: Colors.black,
       items:<BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home,color: Colors.white,), label: "Home",
         backgroundColor: Colors.black,
          tooltip: "Home"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard,color: Colors.white,),
            label: "Leaderboard",
            backgroundColor: Colors.black
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag,color: Colors.white,),
            label: "Portfolio",
            backgroundColor: Colors.black
        ),BottomNavigationBarItem(
            icon: Icon(Icons.history,color: Colors.white,),
            label: "History",
            backgroundColor: Colors.black
        ),BottomNavigationBarItem(
            icon: GestureDetector(
                onTap:(){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "demo")));
    },
            child: Icon(Icons.description,color: Colors.white,)),
            label: "Report",
            tooltip: "Report",
            backgroundColor: Colors.black
        ),
      ],
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          iconSize:22,
          elevation: 5
      ),
      body: ListView(
        children: [
          FutureBuilder(
            future: GetPhotosApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                          ),
                          child: Container(
                            height: screenheight * 0.30,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0),
                                        child: Text("#${index + 1}",
                                          textAlign: TextAlign.justify,),
                                      ),
                                      CircleAvatar(
                                         // backgroundImage: NetworkImage(data[index]['thumbnailUrl'].toString(),),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(data![index]['name'].toString(),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Text(data[index]['company']['name'].toString())
                                            //Text("This is untitled Profile", style: TextStyle(fontSize: 12),),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                          width: screenwidth * 0.30,
                                          child: ElevatedButton(
                                              onPressed: () {},
                                              child: Text("Follower 0"))),
                                      SizedBox(
                                        width: screenwidth * 0.40,
                                        child: ElevatedButton(onPressed: () {},
                                            child: Text("Follow",
                                              style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white
                                            )),
                                      ),
                                    ],
                                  ),
                                 // SizedBox(height: 10,),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Return total (%)"),
                                       Text('lat '+data[index]['address']['geo']['lat'].toString())
                                        // Text("11.52%"),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Max profit (%)"),
                                      Text('lng '+data[index]['address']['geo']['lng'].toString())

                                     // Text("25.47%"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("total profit (%)"),
                                      Text("499.59%"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Perfoance fee (%)"),
                                      Text("20.00-30.00%"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
            }
          )
        ],
      ),
    );
  }}

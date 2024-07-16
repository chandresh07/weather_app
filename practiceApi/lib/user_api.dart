import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'models/UserModel.dart';

//Api calling of list data which start from array

class UserApi extends StatefulWidget {
  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {

  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        userList.add(UserModel.fromJson(i));
      }
      return userList;

    }else{
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title:Text("Api Learning"),
       centerTitle: true,
     ),
     body:Column(
       children: [
         Expanded(
             child:
         FutureBuilder(
           future: getUserApi(),
           builder: (context,snapshot){
             if(!snapshot.hasData){
              return CircularProgressIndicator();
             }else {
               return ListView.builder(
                   itemCount: userList.length,
                   itemBuilder: (context, index) {
                     return Card(
                      child: Column(
                        children: [
                          ReusableRow(title:'name: ', value: snapshot.data![index].name.toString()),
                          ReusableRow(title:'email: ', value: snapshot.data![index].email.toString()),
                          ReusableRow(title:'phone: ', value: snapshot.data![index].phone.toString()),
                          ReusableRow(title:'City: ', value: snapshot.data![index].address!.city.toString())
                        ],
                      ),
                     );
                   });
             }
           },
         ))
       ],
     ) ,
   );
  }}

class ReusableRow extends StatelessWidget{
  String title , value;
  ReusableRow({Key? key , required this.title, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title),
            Text(value),
          ],
        ),
      );
  }
}

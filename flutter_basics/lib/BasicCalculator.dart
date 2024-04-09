

import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const Chandresh(title: "My App"),
    );
  }
}

class Chandresh extends StatefulWidget{
  const Chandresh({super.key, required this.title});
  final String title;
  @override
  State<Chandresh> createState() => _ChandreshState();
}

class _ChandreshState extends State<Chandresh> {

  var No1Controller = TextEditingController();
  var No2Controller = TextEditingController();

  var result ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: const Text("Basic Calculations")),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: No1Controller,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: No2Controller,
                  keyboardType: TextInputType.number,
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(No1Controller.text.toString());
                      var no2 = int.parse(No2Controller.text.toString());

                      var sum = no1+no2;
                      result = 'The Addition is $sum';
                      setState(() {});
                    }, child: Text('+',style: TextStyle(fontSize: 20),)),
                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(No1Controller.text.toString());
                      var no2 = int.parse(No2Controller.text.toString());

                      var sum = no1-no2;
                      result = 'The Subtraction is $sum';
                      setState(() {});
                    }, child: Text('-')),
                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(No1Controller.text.toString());
                      var no2 = int.parse(No2Controller.text.toString());

                      var sum = no1*no2;
                      result = 'The Multiplication is $sum';
                      setState(() {});
                    }, child: Text('*')),
                    ElevatedButton(onPressed: (){
                      var no1 = int.parse(No1Controller.text.toString());
                      var no2 = int.parse(No2Controller.text.toString());

                      var sum = no1/no2;
                      result = 'The Divison is ${sum.toStringAsFixed(2)}';
                      setState(() {});
                    }, child: Text('/')),
                  ],
                ),
                Padding(padding: EdgeInsets.all(21.0)),
                Text(result),

              ],
            ),
          ),
        )
    );
  }
}
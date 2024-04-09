

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

  var counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("flutter"),
        ),
        body: Center(
          child: Column(
            children: [
              Text('counter: $counter',style: TextStyle(fontSize: 30),),
              ElevatedButton(onPressed:(){
                setState(() {
                  counter++;
                  print("clicked");
                });
              }, child: Text("click to count"))
            ],
          ),
        )
    );
  }
}
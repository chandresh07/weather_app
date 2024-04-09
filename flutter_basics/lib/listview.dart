import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    var arrNames = ['raman','rajan','ravi','raju','ramesh','virat','rohit','dhoni','rahul','ravindra'];

    return Scaffold(
        appBar: AppBar(

          title: const Center(child: Text('Name Sheet Container')),
        ),
        body : Container(
          color: Colors.blue,
          child: ListView.builder(itemBuilder: (context, index) {
            return Center(child: Text(arrNames[index],style: const TextStyle(fontWeight: FontWeight.w500),));
          },
            itemCount: arrNames.length,
            itemExtent: 200,
            scrollDirection: Axis.vertical,


          ),
        )
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

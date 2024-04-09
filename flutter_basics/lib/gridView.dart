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
  var  arrColors = [
    Colors.blue,
    Colors.blueGrey,
    Colors.tealAccent,
    Colors.teal,
    Colors.yellow,
    Colors.lightGreen,
    Colors.deepOrange,
    Colors.pink
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: const Center(child: Text('Flutter Projects')),
        ),
        body: GridView.count(crossAxisCount: 3,
          crossAxisSpacing: 11,
          mainAxisSpacing: 11,
          children: [
            Container(color: arrColors[0],),
            Container(color: arrColors[1],),
            Container(color: arrColors[2],),
            Container(color: arrColors[3],),
            Container(color: arrColors[4],),
            Container(color: arrColors[5],),
            Container(color: arrColors[6],),
            Container(color: arrColors[7],),
          ],)
    );
  }// This trailing comma makes auto-formatting nicer for build methods.
}

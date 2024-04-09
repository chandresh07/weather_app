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

    return Scaffold(
        appBar: AppBar(

          title: const Text('Flutter Container'),
        ),
        body : InkWell(
          onDoubleTap: (){
            print(" Double clicked on container");
          },
          onTap: (){
            print("taped on the container");
          },
          onLongPress: (){
            print("long press on container");
          },
          child: Center(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.cyan,
              child: Center(
                  child: InkWell(
                    onTap: ()
                    {
                      print("clicked on text");
                    },
                    child: const Text
                      ("click on me", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  )),
            ),
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

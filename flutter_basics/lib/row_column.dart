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
        body : SizedBox(
          width: 500,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children : [
                    Text("p", style: TextStyle(fontSize: 25),),
                    Text("q", style: TextStyle(fontSize: 25),),
                    Text("r", style: TextStyle(fontSize: 25),),
                    Text("s", style: TextStyle(fontSize: 25),),
                    Text("t", style: TextStyle(fontSize: 25),),


                  ]
              ),
              const Text('A'),
              const Text('B'),
              const Text('C'),
              const Text('D'),
              const Text('E'),
              ElevatedButton(
                onPressed:(){
                },
                child: const Text("click me"),
              )
            ],
          ),
        )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

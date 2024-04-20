import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

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

    var arrNames = ['Rohit Sharma','Shubhaman Gill','Virat Kohali','Shreyas Iyer','KL Rahul','MS Dhoni','Ravindra Jadeja','Hardik Pandya','Kuldeep Yadav','Jashpri Bumrah','Mohhamad Shami','Mohhamad Siraj'];

    return Scaffold(
        appBar: AppBar(

          title: const Center(child: Text('Name Sheet Container')),
        ),
        body :ListView.separated(itemBuilder: (context, index){
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(arrNames[index]),
            subtitle: const Text('number'),
            trailing: const Icon(Icons.add_call),
          );
        },
          itemCount: arrNames.length,
          separatorBuilder: (context, index) {
            return const Divider(height: 100, thickness: 1,);
          },
        )
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}

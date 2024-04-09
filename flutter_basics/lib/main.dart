import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
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
      home:const MyHomePage(title: 'flutter Demo',) ,

    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>{

  TextEditingController phControler = TextEditingController();
  final GlobalKey<FormState> _Formkey = GlobalKey<FormState>();

  var _width = 100.0;
  var _height = 200.0;

  bool flag = true;


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Flutter Contact ")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
        color: Colors.blue,
          width: _width,
          height: _height,
          duration: Duration(seconds : 1),
            ),
            ElevatedButton(onPressed: (){

              setState(() {
                if(flag){
                  _width = 200.0;
                  _height = 100.0;
                  flag = false;
                }
                else
                  {
                    _width = 100.0;
                    _height = 200.0;
                    flag = true;
                  }
              });

            }, child: Text("Animation"))
          ],

        ),
        ),
      );
  }
}


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

          title: const Center(child: Text('Flutter Projects')),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Select Date',style: TextStyle(fontSize: 25),),
              ElevatedButton(onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015),
                    lastDate: DateTime(2022));

                if(pickedDate!= null) {
                  print('date Selected : ${pickedDate.day}${pickedDate.month}${pickedDate.year}');
                }
              }, child: const Text('Select date')),
              ElevatedButton(onPressed:() async {
                TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.input);

                if(pickedTime!= null){
                  print('Time Selected: ${pickedTime.hour}:${pickedTime.minute}:');
                }
              }, child:const Text( 'Select Time'))
            ],
          ),
        )
    );
  }// This trailing comma makes auto-formatting nicer for build methods.
}
